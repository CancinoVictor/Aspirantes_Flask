var pattern_rfc=/^[a-zA-Z]{4}(\d{6})(([a-zA-Z0-9]){3})?$/;
var pattern_tel=/^\d{10}$/;
var pattern_email=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}?$/;
let mensaje = (tipo,titulo,texto,liga) => {
    Swal.fire({
        title: titulo,
        text: texto,
        icon: tipo,
        footer: liga
      });
}
 
let valida_aspirante = () => {
 
    let js_rfc= document.getElementById('f_rfc').value;
    let js_empresa= document.getElementById('f_empresa').value;
    let js_nombre = document.getElementById('f_nombre').value.trim();
    let js_paterno = document.getElementById('f_paterno').value.trim();
    let js_materno = document.getElementById('f_materno').value.trim();
    let js_telefono = document.getElementById('f_telefono').value;
    let js_email = document.getElementById('f_email').value;
    let js_curso = document.getElementById('f_id_curso').value;
 
   //console.log(js_telefono)
 
    if (js_rfc.length == 0) {
        mensaje('error','Error!','El campo RFC es obligatorio!','<a href="https://www.gob.mx/curp/" target="_blank"> Consulte su CURP?</a>');
        return false;
    }
    else if (!pattern_rfc.test(js_rfc)) {
        mensaje('error','Error!','El RFC no es válido. Formato: PETD121214AB0!','<a href="https://www.gob.mx/curp/" target="_blank"> Consulte su CURP?</a>');
        return false;
    }
    else if (js_empresa==0){
        mensaje('error','Error!','Debe seleccionar una empresa!','');
        return false;
    }
    else if (js_nombre.length == 0 || js_paterno.length == 0 || js_materno.length == 0) {
        mensaje('error','Error!','Los campos nombre, paterno y materno son obligatorios!','');
        return false;
    }
 
    else if (js_telefono.length == 0) {
        mensaje('error','Error!','El campo teléfono es obligatorio!','');
        return false;
    }
    else if (js_email.length == 0) {
        mensaje('error','Error!','El campo email es obligatorio!','');
        return false;
    }
    else if (!pattern_email.test(js_email)) {
        mensaje('error','Error!','El correo no cumple el formato. ejemplo: jose@dominio.com.mx','');
        return false;
    }
    else if (js_curso==0){
        mensaje('error','Error!','Debe seleccionar un curso!','');
        return false;
    }
    else if (!pattern_tel.test(js_telefono)) {
        mensaje('error','Error!','El telefono no es válido. Formato: numerico de 10 ','');
        return false;
    }
   
   
    //alert(js_rfc+'-'+js_empresa+'-'+js_nombre+'-'+js_paterno+'-'+js_materno+'-'+js_telefono+'-'+js_email+'-'+js_curso);
    return false;
 
}
    