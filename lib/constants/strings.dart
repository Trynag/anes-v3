// Generals

const String constURL = "https://api.anes.drakotic.co/";
const String constURLApi = "https://api.anes.drakotic.co/api/";

const String constOpenSansSemiBold = "OpenSansSemiBold";
const String constOpenSansRegular = "OpenSansRegular";
const String constOpenSansLight = "OpenSansLight";

const int constSecondaryColorText = 0xD3707070;
const int constErrorColorText = 0xFFed4956;

// const int constShadowColor = 0xD300000029;
const String constErrorMessagePassword =
    "La contraseña no es correcta.\nCompruébala.";
const String constFormUserHintText = "Usuario";
const String constFormPasswordHintText = "Contraseña";
const String constFormButtonLoginText = "Ingresar";

// SNACK CONSTANT
const int constSnackAlertPrimaryColor = 0xFFEE8E2F;
const int constSnackAlertSecondaryColor = 0xFFCD571D;
const int constSnackErrorPrimaryColor = 0xFFFF6060;
const int constSnackErrorSecondaryColor = 0xFFB10000;

const String constSnackSuccessIcon = "assets/images/icons/successSnack.png";
const String constSnackErrorIcon = "assets/images/icons/errorSnack.png";
const String constSnackAlertIcon = "assets/images/icons/alertSnack.png";

// CONDITION, ACTION & INSPECTION
const String constCamera = "assets/images/icons/camara.svg";
const String constInsecureActionWhiteIcon =
    "assets/images/icons/acto-blanco.png";
const String constInsecureActionOrangeIcon =
    "assets/images/icons/acto-orange.png";
const String constInsecureConditionWhiteIcon =
    "assets/images/icons/condicion-blanco.png";
const String constInsecureConditionOrangeIcon =
    "assets/images/icons/condicion-orange.png";
const String constInspectionWhiteIcon =
    "assets/images/icons/inspeccion-blanco.png";
const String constInspectionOrangeIcon =
    "assets/images/icons/inspeccion-orange.png";
const String constPauseWhiteIcon = "assets/images/icons/pausa-blanco.png";
const String constPauseOrangeIcon = "assets/images/icons/pausa-orange.png";
const String constPauseIntroIcon = "assets/images/icons/intro.png";
const String constPauseHeadIcon = "assets/images/icons/pausa-mano.png";
const String constPauseEyeIcon = "assets/images/icons/pausa-ojo.png";
const String constPauseNeckIcon = "assets/images/icons/pausa-cuello.png";
const String constPauseShoulderIcon = "assets/images/icons/pausa-hombro.png";
const String constPauseHandIcon = "assets/images/icons/pausa-mano.png";

Uri constPauseRouteEye = Uri.parse(
    "https://firebasestorage.googleapis.com/v0/b/anes-ff6de.appspot.com/o/pausas%20activas%2FEjercicio%201%20Ojos.mp4?alt=media&token=7f416711-7e6b-4081-ad6d-6aa1d4b7152a");
Uri constPauseRouteIntro = Uri.parse(
    "https://firebasestorage.googleapis.com/v0/b/anes-ff6de.appspot.com/o/pausas%20activas%2Fpausas%20activas%20parte%201%20(2).mp4?alt=media&token=7ff5e927-6f83-4092-9b22-5e71c08ccbac");
Uri constPauseRouteNeck = Uri.parse(
    "https://firebasestorage.googleapis.com/v0/b/anes-ff6de.appspot.com/o/pausas%20activas%2FEjercicio%202%20Cuello.mp4?alt=media&token=720905dd-a1e3-498b-90eb-c4059912fcb2");
Uri constPauseRouteHand = Uri.parse(
    "https://firebasestorage.googleapis.com/v0/b/anes-ff6de.appspot.com/o/pausas%20activas%2FEjercicio%203%20Manos.mp4?alt=media&token=557cd564-1b1e-48ee-ab9f-6dedb80997e6");
Uri constPauseRouteShoulder = Uri.parse(
    "https://firebasestorage.googleapis.com/v0/b/anes-ff6de.appspot.com/o/pausas%20activas%2FEjercicio%204%20Hombros.mp4?alt=media&token=0818e8c4-7053-4abb-9929-1d35b1661b03");

/// SnackBar
const Map<String, Map<String, dynamic>> constSnackMessageDialogs = {
  'errorPhoto': {
    'title': '¡Sin imagen!',
    'description':
        'Para completar un reporte, debes cargar un registro fotografico',
    'primary_color': constSnackErrorPrimaryColor,
    'secondary_color': constSnackErrorSecondaryColor,
    'icon': constSnackErrorIcon,
  },
  'errorLogin': {
    'title': '¡Ups!',
    'description': 'Usuario y contraseña no son correctos',
    'primary_color': constSnackErrorPrimaryColor,
    'secondary_color': constSnackErrorSecondaryColor,
    'icon': constSnackErrorIcon,
  },
  'successReport': {
    'title': 'Reporte realizado',
    'description': 'ha sido reportado con exito',
    'primary_color': constUrbanColorLightTeal,
    'secondary_color': constUrbanColorTeal,
    'icon': constSnackSuccessIcon,
  },
  'warningForm': {
    'title': '¡Campos vacios!',
    'description': 'Por favor, diligencia todos los campos del formulario',
    'primary_color': constSnackAlertPrimaryColor,
    'secondary_color': constSnackAlertSecondaryColor,
    'icon': constSnackAlertIcon,
  }
};

// onBack Message
const String constMessageCloseTitle = 'Cerrar Sesión';
const String constMessageCloseContent =
    'Vas a ser redireccionado a la Login de la app ¿Quieres cerrar sesión?.';
const String constMessageBackTitle = 'Cerrar ANES';
const String constMessageBackContent =
    'Puede que tal vez no hayas realizado todos tus reportes, aunque también puedes continuar con ellos en cualquier otro momento.';

// All urban constant layout

const String constUrbanLogo = "assets/images/icons/urban/anes-hdpi.png";
const String constUrbanBackground =
    "assets/images/background/urban/urban-hdpi.png";
const String constUrbanIconUser = "assets/images/icons/urban/inputs/user.svg";
const String constUrbanIconPassword =
    "assets/images/icons/urban/inputs/password.svg";

const int constUrbanColorLightTeal = 0xFF8fcccb; // Use in snack success message
const int constUrbanColorTeal = 0xFF00A19F; // Use in snack success message

// All agro constant layout

const String constAgroBackground =
    "assets/images/background/agro/agro-hdpi.png";
const String constAgroLogo = "assets/images/icons/agro/anes-hdpi.png";

const int constAgroColorLightGreen = 0xFFCFEAC1;
const int constAgroColorGreen = 0xFF39A900;
