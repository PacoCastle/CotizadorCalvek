using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ExamenVO
/// </summary>
public class ExamenVO
{
    private string nombre;
    private int edad;
    private string sexo;
    private DateTime  fecha;
    private string escolaridad;
    private string telefono;
    private string direccion;
    private string nacionalidad;

    private string hlIdTipoIngreso;
    private string hlPuestoSol;
    private string hlArea;
    private string hlUltimoEmpleo;
    private string hlFactorRiesgo;
    private string hlAntiguedad;
    private string hlUltimoEmpleotwo;
    private string hlFactorRiesgotwo;
    private string hlAntiguedadtwo;
    private int hlAntecedentesPenales;
    private string hlEspecificar;

    private string hlPPuestoAct;
    private string hlPAreaAct;
    private string hlPAntiguedadPuestoAct;
    private string hlPAntiguedadAreaAct;
    private string hlPFactorRiesgoAct;


    private int ahfDiabetes;
    private int ahfHta;
    private int ahfEpilepsia;
    private int ahfCardipatia;
    private int ahfRenales;
    private int ahfAsma;
    private int ahfCancer;
    private int ahfMentales;
    private string ahfotras;

    private string aptAlcoholismo;
    private int aptEdadComienzo;
    private int aptFrecuencia;
    private int aptSuspAlcoholismo;
    private string aptTiempoSuspAlcoholismo;
    private string aptTiempoSuspTabaquismo;
    private string aptTabaquismo;
    private int aptEdadComiecoTwo;
    private int aptFrecuenciaTwo;
    private string aptSuspTabaquismo;
    private string aptCantidadDiaCigarros;
    private string aptDrogas;
    private string aptDrogasEspecifique;
    private string aptUltimoConsumo;
    private int aptEjercicio;
    private string aptFrecuenciaTree;
    private string aptTipoEjercicio;
    private string aptEspecEjercicio;
    private int aptAlimentacion;
    private string aptGrupoYRh;
    private int apttatuajes;
    private string aptEspecifique;
    private string aptTxMedicoActual;

    private string apDiabetes;
    private string apTifoidea;
    private string apRenales;
    private string apHernias;
    private string apHta;
    private string apAsma;
    private string apEpilepsia;
    private string apHemorroides;
    private string apCancer;
    private string apAlergias;
    private string apVertigo;
    private string apTraumatismos;
    private string apBronquitis;
    private string apDermatitis;
    private string apFracturas;
    private string apGinecologicos;
    private string apNeumonias;
    private string apVarices;
    private string apCirugias;
    private string apEnfTransSexual;
    private string apExantematicas;
    private string apEspecificacion;
    private string apPsiquiatricas;
    private string apOtras;
    private string apCardipatias;
    private string apParotiditis;
    private string apDesmayos;
    private string apPatologiaCVertebral;
    private string apTuberculosis;
    private string apHepatitis;
    private string apTransfuciones;
    private string apEndocrinopatias;



    private string agMenarca;
    private string agIvs;
    private string agVsa;
    private string agFum;
    private string agRitmo;
    private string agMpf;
    private string agDoc;
    private string agGesta;
    private string agParto;
    private string agCesarea;
    private string agAborto;
    private string agFupFuc;

    private string inmToxoide;
    private string inmSarampion;
    private string inmRubeola;
    private string inmHepatitisB;
    private string inmNeumococo;
    private string inmInfluenza;
    private string inmOtra;
    private string inmProximaDosis;

    private string ssvTammHg;
    private string ssvFcMin;
    private string ssvFrMin;
    private string ssvT;
    private string ssvpesoKg;
    private string ssvTallaCm;
    private string ssvImc;
    private string ssvComplexion;
    private string ssvCintura;
    private string ssvCadera;
  
    private string eoVisionLejanaOd;
    private string eoVisionLejenaOi;
    private string eoVisionCercanaOd;
    private string eoVisionCercanaOi;
    private string eoReflejos;
    private string eoCorregidaOd;
    private string eoCorregidaOi;
    private string eoCercanaCorregidaOd;
    private string eoCercanaCorregidaOi;
    private string eoDaltonismo;
    private string eoCampimetria;

    private string efNeurologico;
    private string efCraneo;
    private string efPielyFaneras;
    private string efOidosCad;
    private string efOjos;
    private string efBoca;
    private string efNariz;
    private string efFaringe;
    private string efCuello;
    private string efTorax;
    private string efCorazon;
    private string efCamposPulmonares;
    private string efAbdomen;
    private string efColumnaVertebral;
    private string efTestAdam;
    private string efTestRomberg;
    private string efMsSuperiores;
    private string efMsInferirores;
    private string efCirculacion;
    private string efArcoMovilidad;
    private string efTonoMuscular;
    private string efFuerzaMuscular;
    private string efFuerzaMuscularDaniel;
    private string efCoordinacion;
    private string efRomberg;
    private string efPruebaFinkelestein;
    private string efSignoTinel;
    private string efPruebaPhabel;
    private string efPruebaLasage;
    private string efSignoBraggard;
    private string efPresenciaQuiste;
    private string efOidosCai;
    private string efEfEspecificar;

    private string iDAgudezaNormal;
    private string iDPresionArt;

    private string rRealizoEM;
    private string rRevisoEM;
    private string rCedProf;
    private string rCedProftwo;

    public ExamenVO()
    {
        nombre = "";
    }

    #region Datos Personales
    public string Nombre
    {
        get
        {
            return nombre;
        }

        set
        {
            nombre = value;
        }
    }

    public int Edad
    {
        get
        {
            return edad;
        }

        set
        {
            edad = value;
        }
    }

    public string Sexo
    {
        get
        {
            return sexo;
        }

        set
        {
            sexo = value;
        }
    }

    public DateTime  Fecha
    {
        get
        {
            return fecha;
        }

        set
        {
            fecha = value;
        }
    }

    public string Escolaridad
    {
        get
        {
            return escolaridad;
        }

        set
        {
            escolaridad = value;
        }
    }

    public string Telefono
    {
        get
        {
            return telefono;
        }

        set
        {
            telefono = value;
        }
    }

    public string Direccion
    {
        get
        {
            return direccion;
        }

        set
        {
            direccion = value;
        }
    }

    public string Nacionalidad
    {
        get
        {
            return nacionalidad;
        }

        set
        {
            nacionalidad = value;
        }
    }


    #endregion

    #region Historia Laboral


    public string HLIdTipoIngreso
    {
        get
        {
            return hlIdTipoIngreso;
        }

        set
        {
            hlIdTipoIngreso = value;
        }
    }

    public string HlPuestoSol
    {
        get
        {
            return hlPuestoSol;
        }

        set
        {
            hlPuestoSol = value;
        }
    }

   

    public string HlArea
    {
        get
        {
            return hlArea;
        }

        set
        {
            hlArea = value;
        }
    }

    public string HlUltimoEmpleo
    {
        get
        {
            return hlUltimoEmpleo;
        }

        set
        {
            hlUltimoEmpleo = value;
        }
    }

    public string HlFactorRiesgo
    {
        get
        {
            return hlFactorRiesgo;
        }

        set
        {
            hlFactorRiesgo = value;
        }
    }

    public string HlAntiguedad
    {
        get
        {
            return hlAntiguedad;
        }

        set
        {
            hlAntiguedad = value;
        }
    }

    public string HlUltimoEmpleotwo
    {
        get
        {
            return hlUltimoEmpleotwo;
        }

        set
        {
            hlUltimoEmpleotwo = value;
        }
    }

    public string HlFactorRiesgotwo
    {
        get
        {
            return hlFactorRiesgotwo;
        }

        set
        {
            hlFactorRiesgotwo = value;
        }
    }

    public string HlAntiguedadtwo
    {
        get
        {
            return hlAntiguedadtwo;
        }

        set
        {
            hlAntiguedadtwo = value;
        }
    }

    public int HlAntecedentesPenales
    {
        get
        {
            return hlAntecedentesPenales;
        }

        set
        {
            hlAntecedentesPenales = value;
        }
    }

    public string HlEspecificar
    {
        get
        {
            return hlEspecificar;
        }

        set
        {
            hlEspecificar = value;
        }
    }



    #endregion

    #region "Historia Laboral Periodico"
    public string HlPPuestoAct
    {
        get
        {
            return hlPPuestoAct;
        }

        set
        {
            hlPPuestoAct = value;
        }
    }

    public string HlPAreaAct
    {
        get
        {
            return hlPAreaAct;
        }

        set
        {
            hlPAreaAct = value;
        }
    }

    public string HlPAntiguedadPuestoAct
    {
        get
        {
            return hlPAntiguedadPuestoAct;
        }

        set
        {
            hlPAntiguedadPuestoAct = value;
        }
    }

    public string HlPAntiguedadAreaAct
    {
        get
        {
            return hlPAntiguedadAreaAct;
        }

        set
        {
            hlPAntiguedadAreaAct = value;
        }
    }

    public string HlPFactorRiesgoAct
    {
        get
        {
            return hlPFactorRiesgoAct;
        }

        set
        {
            hlPFactorRiesgoAct = value;
        }
    }
    #endregion

    #region Antecedentes Heredo-Familiares
    public int AhfDiabetes
    {
        get
        {
            return ahfDiabetes;
        }

        set
        {
            ahfDiabetes = value;
        }
    }

    public int AhfHta
    {
        get
        {
            return ahfHta;
        }

        set
        {
            ahfHta = value;
        }
    }

    public int AhfEpilepsia
    {
        get
        {
            return ahfEpilepsia;
        }

        set
        {
            ahfEpilepsia = value;
        }
    }

    public int AhfCardipatia
    {
        get
        {
            return ahfCardipatia;
        }

        set
        {
            ahfCardipatia = value;
        }
    }

    public int AhfRenales
    {
        get
        {
            return ahfRenales;
        }

        set
        {
            ahfRenales = value;
        }
    }

    public int AhfAsma
    {
        get
        {
            return ahfAsma;
        }

        set
        {
            ahfAsma = value;
        }
    }

    public int AhfCancer
    {
        get
        {
            return ahfCancer;
        }

        set
        {
            ahfCancer = value;
        }
    }

    public int AhfMentales
    {
        get
        {
            return ahfMentales;
        }

        set
        {
            ahfMentales = value;
        }
    }

    public string Ahfotras
    {
        get
        {
            return ahfotras;
        }

        set
        {
            ahfotras = value;
        }
    }



    #endregion

    #region "Antecedentes No Patologicos y toxicomanias" 
    public string AptAlcoholismo
    {
        get
        {
            return aptAlcoholismo;
        }

        set
        {
            aptAlcoholismo = value;
        }
    }

    public int AptEdadComienzo
    {
        get
        {
            return aptEdadComienzo;
        }

        set
        {
            aptEdadComienzo = value;
        }
    }

    public int AptFrecuencia
    {
        get
        {
            return aptFrecuencia;
        }

        set
        {
            aptFrecuencia = value;
        }
    }

    public int AptSusAlcoholismo
    {
        get
        {
            return aptSuspAlcoholismo;
        }

        set
        {
            aptSuspAlcoholismo = value;
        }
    }

    public string AptTiempoSuspAlcoholismo
    {
        get
        {
            return aptTiempoSuspAlcoholismo;
        }

        set
        {
            aptTiempoSuspAlcoholismo = value;
        }
    }

    public string AptTiempoSuspTabaquismo
    {
        get
        {
            return aptTiempoSuspTabaquismo;
        }

        set
        {
            aptTiempoSuspTabaquismo = value;
        }
    }

    public string AptTabaquismo
    {
        get
        {
            return aptTabaquismo;
        }

        set
        {
            aptTabaquismo = value;
        }
    }

    public int AptEdadComiecoTwo
    {
        get
        {
            return aptEdadComiecoTwo;
        }

        set
        {
            aptEdadComiecoTwo = value;
        }
    }

    public int AptFrecuenciaTwo
    {
        get
        {
            return aptFrecuenciaTwo;
        }

        set
        {
            aptFrecuenciaTwo = value;
        }
    }

    public string AptSuspTabaquismo
    {
        get
        {
            return aptSuspTabaquismo;
        }

        set
        {
            aptSuspTabaquismo = value;
        }
    }

    public string AptCantidadDiaCigarros
    {
        get
        {
            return aptCantidadDiaCigarros;
        }

        set
        {
            aptCantidadDiaCigarros = value;
        }
    }

    public string AptDrogas
    {
        get
        {
            return aptDrogas;
        }

        set
        {
            aptDrogas = value;
        }
    }

    public string AptDrogasEspecifique
    {
        get
        {
            return aptDrogasEspecifique;
        }

        set
        {
            aptDrogasEspecifique = value;
        }
    }

    public string AptUltimoConsumo
    {
        get
        {
            return aptUltimoConsumo;
        }

        set
        {
            aptUltimoConsumo = value;
        }
    }

    public int AptEjercicio
    {
        get
        {
            return aptEjercicio;
        }

        set
        {
            aptEjercicio = value;
        }
    }

    public string AptFrecuenciaTree
    {
        get
        {
            return aptFrecuenciaTree;
        }

        set
        {
            aptFrecuenciaTree = value;
        }
    }

    public string AptTipoEjercicio
    {
        get
        {
            return aptTipoEjercicio;
        }

        set
        {
            aptTipoEjercicio = value;
        }
    }

    public string AptEspecEjercicio
    {
        get
        {
            return aptEspecEjercicio;
        }

        set
        {
            aptEspecEjercicio = value;
        }
    }



    public int AptAlimentacion
    {
        get
        {
            return aptAlimentacion;
        }

        set
        {
            aptAlimentacion = value;
        }
    }

    public string AptGrupoYRh
    {
        get
        {
            return aptGrupoYRh;
        }

        set
        {
            aptGrupoYRh = value;
        }
    }

    public int Apttatuajes
    {
        get
        {
            return apttatuajes;
        }

        set
        {
            apttatuajes = value;
        }
    }

    public string AptEspecifique
    {
        get
        {
            return aptEspecifique;
        }

        set
        {
            aptEspecifique = value;
        }
    }

    public string AptTxMedicoActual
    {
        get
        {
            return aptTxMedicoActual;
        }

        set
        {
            aptTxMedicoActual = value;
        }
    }


    #endregion

    #region "Atecedentes Patologicos"
    public string ApDiabetes
    {
        get
        {
            return apDiabetes;
        }

        set
        {
            apDiabetes = value;
        }
    }

    public string ApTifoidea
    {
        get
        {
            return apTifoidea;
        }

        set
        {
            apTifoidea = value;
        }
    }

    public string ApRenales
    {
        get
        {
            return apRenales;
        }

        set
        {
            apRenales = value;
        }
    }

    public string ApHernias
    {
        get
        {
            return apHernias;
        }

        set
        {
            apHernias = value;
        }
    }

    public string ApHta
    {
        get
        {
            return apHta;
        }

        set
        {
            apHta = value;
        }
    }

    public string ApAsma
    {
        get
        {
            return apAsma;
        }

        set
        {
            apAsma = value;
        }
    }

    public string ApEpilepsia
    {
        get
        {
            return apEpilepsia;
        }

        set
        {
            apEpilepsia = value;
        }
    }

    public string ApHemorroides
    {
        get
        {
            return apHemorroides;
        }

        set
        {
            apHemorroides = value;
        }
    }

    public string ApCancer
    {
        get
        {
            return apCancer;
        }

        set
        {
            apCancer = value;
        }
    }

    public string ApAlergias
    {
        get
        {
            return apAlergias;
        }

        set
        {
            apAlergias = value;
        }
    }

    public string ApVertigo
    {
        get
        {
            return apVertigo;
        }

        set
        {
            apVertigo = value;
        }
    }

    public string ApTraumatismos
    {
        get
        {
            return apTraumatismos;
        }

        set
        {
            apTraumatismos = value;
        }
    }

    public string ApBronquitis
    {
        get
        {
            return apBronquitis;
        }

        set
        {
            apBronquitis = value;
        }
    }

    public string ApDermatitis
    {
        get
        {
            return apDermatitis;
        }

        set
        {
            apDermatitis = value;
        }
    }

    public string ApFracturas
    {
        get
        {
            return apFracturas;
        }

        set
        {
            apFracturas = value;
        }
    }

    public string ApGinecologicos
    {
        get
        {
            return apGinecologicos;
        }

        set
        {
            apGinecologicos = value;
        }
    }

    public string ApNeumonias
    {
        get
        {
            return apNeumonias;
        }

        set
        {
            apNeumonias = value;
        }
    }

    public string ApVarices
    {
        get
        {
            return apVarices;
        }

        set
        {
            apVarices = value;
        }
    }

    public string ApCirugias
    {
        get
        {
            return apCirugias;
        }

        set
        {
            apCirugias = value;
        }
    }

    public string ApEnfTransSexual
    {
        get
        {
            return apEnfTransSexual;
        }

        set
        {
            apEnfTransSexual = value;
        }
    }

    public string ApExantematicas
    {
        get
        {
            return apExantematicas;
        }

        set
        {
            apExantematicas = value;
        }
    }

    public string ApEspecificacion
    {
        get
        {
            return apEspecificacion;
        }

        set
        {
            apEspecificacion = value;
        }
    }

    public string ApPsiquiatricas
    {
        get
        {
            return apPsiquiatricas;
        }

        set
        {
            apPsiquiatricas = value;
        }
    }

    public string ApOtras
    {
        get
        {
            return apOtras;
        }

        set
        {
            apOtras = value;
        }
    }


    public string ApCardipatias
    {
        get
        {
            return apCardipatias;
        }

        set
        {
            apCardipatias = value;
        }
    }

    public string ApParotiditis
    {
        get
        {
            return apParotiditis;
        }

        set
        {
            apParotiditis = value;
        }
    }

    public string ApDesmayos
    {
        get
        {
            return apDesmayos;
        }

        set
        {
            apDesmayos = value;
        }
    }

    public string ApPatologiaCVertebral
    {
        get
        {
            return apPatologiaCVertebral;
        }

        set
        {
            apPatologiaCVertebral = value;
        }
    }

    public string ApTuberculosis
    {
        get
        {
            return apTuberculosis;
        }

        set
        {
            apTuberculosis = value;
        }
    }

    public string ApHepatitis
    {
        get
        {
            return apHepatitis;
        }

        set
        {
            apHepatitis = value;
        }
    }

    public string ApTransfuciones
    {
        get
        {
            return apTransfuciones;
        }

        set
        {
            apTransfuciones = value;
        }
    }

    public string ApEndocrinopatias
    {
        get
        {
            return apEndocrinopatias;
        }

        set
        {
            apEndocrinopatias = value;
        }
    }

    #endregion

    #region "Antecedentes Ginecologicos"
    public string AgMenarca
    {
        get
        {
            return agMenarca;
        }

        set
        {
            agMenarca = value;
        }
    }

    public string AgIvs
    {
        get
        {
            return agIvs;
        }

        set
        {
            agIvs = value;
        }
    }

    public string AgVsa
    {
        get
        {
            return agVsa;
        }

        set
        {
            agVsa = value;
        }
    }

    public string AgFum
    {
        get
        {
            return agFum;
        }

        set
        {
            agFum = value;
        }
    }

    public string AgRitmo
    {
        get
        {
            return agRitmo;
        }

        set
        {
            agRitmo = value;
        }
    }

    public string AgMpf
    {
        get
        {
            return agMpf;
        }

        set
        {
            agMpf = value;
        }
    }

    public string AgDoc
    {
        get
        {
            return agDoc;
        }

        set
        {
            agDoc = value;
        }
    }

    public string AgGesta
    {
        get
        {
            return agGesta;
        }

        set
        {
            agGesta = value;
        }
    }

    public string AgParto
    {
        get
        {
            return agParto;
        }

        set
        {
            agParto = value;
        }
    }

    public string AgCesarea
    {
        get
        {
            return agCesarea;
        }

        set
        {
            agCesarea = value;
        }
    }

    public string AgAborto
    {
        get
        {
            return agAborto;
        }

        set
        {
            agAborto = value;
        }
    }

    public string AgFupFuc
    {
        get
        {
            return agFupFuc;
        }

        set
        {
            agFupFuc = value;
        }
    }
    #endregion

    #region "Inmunizaciones"
    public string InmToxoide
    {
        get
        {
            return inmToxoide;
        }

        set
        {
            inmToxoide = value;
        }
    }

    public string InmSarampion
    {
        get
        {
            return inmSarampion;
        }

        set
        {
            inmSarampion = value;
        }
    }

    public string InmRubeola
    {
        get
        {
            return inmRubeola;
        }

        set
        {
            inmRubeola = value;
        }
    }

    public string InmHepatitisB
    {
        get
        {
            return inmHepatitisB;
        }

        set
        {
            inmHepatitisB = value;
        }
    }

    public string InmNeumococo
    {
        get
        {
            return inmNeumococo;
        }

        set
        {
            inmNeumococo = value;
        }
    }

    public string InmInfluenza
    {
        get
        {
            return inmInfluenza;
        }

        set
        {
            inmInfluenza = value;
        }
    }

    public string InmOtra
    {
        get
        {
            return inmOtra;
        }

        set
        {
            inmOtra = value;
        }
    }

    public string InmProximaDosis
    {
        get
        {
            return inmProximaDosis;
        }

        set
        {
            inmProximaDosis = value;
        }
    }

    #endregion

    #region "Somatometria / Signos Vitales"
    public string SsvTammHg
    {
        get
        {
            return ssvTammHg;
        }

        set
        {
            ssvTammHg = value;
        }
    }

    public string SsvFcMin
    {
        get
        {
            return ssvFcMin;
        }

        set
        {
            ssvFcMin = value;
        }
    }

    public string SsvFrMin
    {
        get
        {
            return ssvFrMin;
        }

        set
        {
            ssvFrMin = value;
        }
    }

    public string SsvT
    {
        get
        {
            return ssvT;
        }

        set
        {
            ssvT = value;
        }
    }

    public string SsvpesoKg
    {
        get
        {
            return ssvpesoKg;
        }

        set
        {
            ssvpesoKg = value;
        }
    }

    public string SsvTallaCm
    {
        get
        {
            return ssvTallaCm;
        }

        set
        {
            ssvTallaCm = value;
        }
    }

    public string SsvImc
    {
        get
        {
            return ssvImc;
        }

        set
        {
            ssvImc = value;
        }
    }

    public string SsvComplexion
    {
        get
        {
            return ssvComplexion;
        }

        set
        {
            ssvComplexion = value;
        }
    }

    public string SsvCintura
    {
        get
        {
            return ssvCintura;
        }

        set
        {
            ssvCintura = value;
        }
    }

    public string SsvCadera
    {
        get
        {
            return ssvCadera;
        }

        set
        {
            ssvCadera = value;
        }
    }

    #endregion

    #region "Examen Oftalmologico"
    public string EoVisionLejanaOd
    {
        get
        {
            return eoVisionLejanaOd;
        }

        set
        {
            eoVisionLejanaOd = value;
        }
    }

    public string EoVisionLejenaOi
    {
        get
        {
            return eoVisionLejenaOi;
        }

        set
        {
            eoVisionLejenaOi = value;
        }
    }

    public string EoVisionCercanaOd
    {
        get
        {
            return eoVisionCercanaOd;
        }

        set
        {
            eoVisionCercanaOd = value;
        }
    }

    public string EoVisionCercanaOi
    {
        get
        {
            return eoVisionCercanaOi;
        }

        set
        {
            eoVisionCercanaOi = value;
        }
    }

    public string EoReflejos
    {
        get
        {
            return eoReflejos;
        }

        set
        {
            eoReflejos = value;
        }
    }

    public string EoCorregidaOd
    {
        get
        {
            return eoCorregidaOd;
        }

        set
        {
            eoCorregidaOd = value;
        }
    }

    public string EoCorregidaOi
    {
        get
        {
            return eoCorregidaOi;
        }

        set
        {
            eoCorregidaOi = value;
        }
    }

    public string EoDaltonismo
    {
        get
        {
            return eoDaltonismo;
        }

        set
        {
            eoDaltonismo = value;
        }
    }

    public string EoCampimetria
    {
        get
        {
            return eoCampimetria;
        }

        set
        {
            eoCampimetria = value;
        }
    }
    public string EoCercanaCorregidaOd
    {
        get
        {
            return eoCercanaCorregidaOd;
        }

        set
        {
            eoCercanaCorregidaOd = value;
        }
    }

    public string EoCercanaCorregidaOi
    {
        get
        {
            return eoCercanaCorregidaOi;
        }

        set
        {
            eoCercanaCorregidaOi = value;
        }
    }


    #endregion

    #region "Exploracion Fisica"

    public string EfNeurologico
    {
        get
        {
            return efNeurologico;
        }

        set
        {
            efNeurologico = value;
        }
    }

    public string EfCraneo
    {
        get
        {
            return efCraneo;
        }

        set
        {
            efCraneo = value;
        }
    }

    public string EfPielyFaneras
    {
        get
        {
            return efPielyFaneras;
        }

        set
        {
            efPielyFaneras = value;
        }
    }

    public string EfOidosCad
    {
        get
        {
            return efOidosCad;
        }

        set
        {
            efOidosCad = value;
        }
    }

    public string EfOidosCai
    {
        get
        {
            return efOidosCai;
        }

        set
        {
            efOidosCai = value;
        }
    }

    public string EfOjos
    {
        get
        {
            return efOjos;
        }

        set
        {
            efOjos = value;
        }
    }

    public string EfBoca
    {
        get
        {
            return efBoca;
        }

        set
        {
            efBoca = value;
        }
    }

    public string EfNariz
    {
        get
        {
            return efNariz;
        }

        set
        {
            efNariz = value;
        }
    }

    public string EfFaringe
    {
        get
        {
            return efFaringe;
        }

        set
        {
            efFaringe = value;
        }
    }

    public string EfCuello
    {
        get
        {
            return efCuello;
        }

        set
        {
            efCuello = value;
        }
    }

    public string EfTorax
    {
        get
        {
            return efTorax;
        }

        set
        {
            efTorax = value;
        }
    }

    public string EfCorazon
    {
        get
        {
            return efCorazon;
        }

        set
        {
            efCorazon = value;
        }
    }

    public string EfCamposPulmonares
    {
        get
        {
            return efCamposPulmonares;
        }

        set
        {
            efCamposPulmonares = value;
        }
    }

    public string EfAbdomen
    {
        get
        {
            return efAbdomen;
        }

        set
        {
            efAbdomen = value;
        }
    }

    public string EfColumnaVertebral
    {
        get
        {
            return efColumnaVertebral;
        }

        set
        {
            efColumnaVertebral = value;
        }
    }

    public string EfTestAdam
    {
        get
        {
            return efTestAdam;
        }

        set
        {
            efTestAdam = value;
        }
    }

    public string EfTestRomberg
    {
        get
        {
            return efTestRomberg;
        }

        set
        {
            efTestRomberg = value;
        }
    }


    public string EfMsSuperiores
    {
        get
        {
            return efMsSuperiores;
        }

        set
        {
            efMsSuperiores = value;
        }
    }

    public string EfMsInferirores
    {
        get
        {
            return efMsInferirores;
        }

        set
        {
            efMsInferirores = value;
        }
    }

    public string EfCirculacion
    {
        get
        {
            return efCirculacion;
        }

        set
        {
            efCirculacion = value;
        }
    }

    public string EfArcoMovilidad
    {
        get
        {
            return efArcoMovilidad;
        }

        set
        {
            efArcoMovilidad = value;
        }
    }

    public string EfTonoMuscular
    {
        get
        {
            return efTonoMuscular;
        }

        set
        {
            efTonoMuscular = value;
        }
    }

    public string EfFuerzaMuscular
    {
        get
        {
            return efFuerzaMuscular;
        }

        set
        {
            efFuerzaMuscular = value;
        }
    }

    public string EfFuerzaMuscularDaniels
    {
        get
        {
            return efFuerzaMuscularDaniel;
        }

        set
        {
            efFuerzaMuscularDaniel = value;
        }
    }

    public string EfCoordinacion
    {
        get
        {
            return efCoordinacion;
        }

        set
        {
            efCoordinacion = value;
        }
    }

    public string EfRomberg
    {
        get
        {
            return efRomberg;
        }

        set
        {
            efRomberg = value;
        }
    }

    public string EfPruebaFinkelestein
    {
        get
        {
            return efPruebaFinkelestein;
        }

        set
        {
            efPruebaFinkelestein = value;
        }
    }

    public string EfSignoTinel
    {
        get
        {
            return efSignoTinel;
        }

        set
        {
            efSignoTinel = value;
        }
    }

    public string EfPruebaPhabel
    {
        get
        {
            return efPruebaPhabel;
        }

        set
        {
            efPruebaPhabel = value;
        }
    }

    public string EfPruebaLasage
    {
        get
        {
            return efPruebaLasage;
        }

        set
        {
            efPruebaLasage = value;
        }
    }

    public string EfSignoBraggard
    {
        get
        {
            return efSignoBraggard;
        }

        set
        {
            efSignoBraggard = value;
        }
    }

    public string EfPresenciaQuiste
    {
        get
        {
            return efPresenciaQuiste;
        }

        set
        {
            efPresenciaQuiste = value;
        }
    }

    public string EfEspecificar
    {
        get
        {
            return efEfEspecificar;
        }

        set
        {
            efEfEspecificar = value;
        }
    }


    #endregion

    #region "IMPRESIÓN DIAGNOSTICA"

    public string IDAgudezaNormal
    {
        get
        {
            return iDAgudezaNormal;
        }

        set
        {
            iDAgudezaNormal = value;
        }
    }

    public string IDPresionArt
    {
        get
        {
            return iDPresionArt;
        }

        set
        {
            iDPresionArt = value;
        }
    }


    #endregion

    #region VALORACIÓN MÉDICA Y VISUAL ANUAL.


    public string RRealizoEM
    {
        get
        {
            return rRealizoEM;
        }

        set
        {
            rRealizoEM = value;
        }
    }

    public string RRevisoEM
    {
        get
        {
            return rRevisoEM;
        }

        set
        {
            rRevisoEM = value;
        }
    }

    public string RCedProf
    {
        get
        {
            return rCedProf;
        }

        set
        {
            rCedProf = value;
        }
    }

    public string RCedProftwo
    {
        get
        {
            return rCedProftwo;
        }

        set
        {
            rCedProftwo = value;
        }
    }


    #endregion

}