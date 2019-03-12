// A função a seguir bloqueia a execução do evento onclick de botão ou Link aguardando a resposta do
// RadConfirm para continuar a execução ou não

function blockConfirm(msg,title,width,height,clickedButton) {

    function confirmHandler(args) {
        if (args == true) {
            __doPostBack(clickedButton.name, "");
        }
    }

    radconfirm(msg, confirmHandler, width, height, null, title);
    return false;

}