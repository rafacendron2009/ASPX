// A fun��o a seguir bloqueia a execu��o do evento onclick de bot�o ou Link aguardando a resposta do
// RadConfirm para continuar a execu��o ou n�o

function blockConfirm(msg,title,width,height,clickedButton) {

    function confirmHandler(args) {
        if (args == true) {
            __doPostBack(clickedButton.name, "");
        }
    }

    radconfirm(msg, confirmHandler, width, height, null, title);
    return false;

}