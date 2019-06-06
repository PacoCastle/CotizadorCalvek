using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.IO;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System.Configuration;

/// <summary>
/// Descripción breve de BlobManager
/// </summary>
namespace CotizadorCalvek.Blob_Storage
{

    public class BlobManager
    {
        static CloudBlobClient blobClient;
        const string blobContainerName = "webappstoragedotnet-imagecontainer";
        static CloudBlobContainer blobContainer;

        public BlobManager()
        {
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(ConfigurationManager.AppSettings["StorageConnectionString"].ToString());

            // Create a blob client for interacting with the blob service.
            blobClient = storageAccount.CreateCloudBlobClient();
            blobContainer = blobClient.GetContainerReference(blobContainerName);
            blobContainer.CreateIfNotExists();

            blobContainer.SetPermissions(new BlobContainerPermissions { PublicAccess = BlobContainerPublicAccessType.Blob });
        }

        public List<Uri> GetImages()
        {
            try
            {
                // Gets all Cloud Block Blobs in the blobContainerName and passes them to teh view
                List<Uri> allBlobs = new List<Uri>();
                foreach (IListBlobItem blob in blobContainer.ListBlobs())
                {
                    if (blob.GetType() == typeof(CloudBlockBlob))
                        allBlobs.Add(blob.Uri);
                }

                return allBlobs;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public string UploadImage(IList<HttpPostedFile> files)
        //public string UploadImage(string fileName, Stream source)
        {
            string uploaded = "";
            try
            {
                //string blobimagename = GetRandomBlobName(fileName);
                //CloudBlockBlob blob = blobContainer.GetBlockBlobReference(blobimagename);
                //blob.UploadFromStream(source);

                //uploaded = GetUploadedBlobImage(blobimagename);
                //return uploaded;
                int fileCount = files.Count;

                if (fileCount > 0)
                {
                    for (int i = 0; i < fileCount; i++)
                    {
                        var source = files[i].InputStream;

                        string blobimagename = GetRandomBlobName(files[i].FileName);
                        CloudBlockBlob blob = blobContainer.GetBlockBlobReference(blobimagename);
                        blob.Properties.ContentType = "image/jpeg";

                        blob.UploadFromStream(source);

                        uploaded = GetUploadedBlobImage(blobimagename);
                    }
                }
                return uploaded;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public string UploadImageByStream(Stream pStream, string fileName)
        {
            string uploaded = "";
            try
            {
                if (pStream.Length > 0)
                {
                    string blobimagename = GetRandomBlobName(fileName);
                    CloudBlockBlob blob = blobContainer.GetBlockBlobReference(blobimagename);
                    blob.Properties.ContentType = "image/jpeg";
                    blob.UploadFromStream(pStream);

                    uploaded = GetUploadedBlobImage(blobimagename);
                }
                return uploaded;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

      


        public bool DeleteAll()
        {
            try
            {
                foreach (var blob in blobContainer.ListBlobs())
                {
                    if (blob.GetType() == typeof(CloudBlockBlob))
                    {
                        ((CloudBlockBlob)blob).DeleteIfExists();
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool DeleteByResourceId(string resourceId)
        {
            try
            {
                CloudBlockBlob currentBlob = blobContainer.GetBlockBlobReference(resourceId);
                currentBlob.Delete();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        private string GetRandomBlobName(string filename)
        {
            string ext = Path.GetExtension(filename);
            return string.Format("{0:10}_{1}{2}", DateTime.Now.Ticks, Guid.NewGuid(), ext);
        }

        private string GetUploadedBlobImage(string filename, int searchCount = 0)
        {
            string AbsoluthURI = "";

            var blobs = blobContainer.ListBlobs().OfType<CloudBlob>()
            .Where(b => b.Name.Contains(filename))
            .OrderByDescending(b => b.Properties.LastModified).Skip(searchCount * 10).Take(10);

            searchCount++;

            if (blobs.Count() == 0)
            {
                GetUploadedBlobImage(filename, searchCount);
            }
            else
            {
                AbsoluthURI = blobs.FirstOrDefault().Uri.AbsoluteUri;
            }

            return AbsoluthURI;
        }
    }
}