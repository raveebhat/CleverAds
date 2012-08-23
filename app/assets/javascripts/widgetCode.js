function widgetCode(user)
{  
var width = parseInt(document.getElementById("width").value);
var height = parseInt(document.getElementById("height").value);
var align = document.getElementById("align").value;
var widgetCode = document.getElementById("widgetCode");
var comment = "\""
var code = "<div style="+comment+"width:"+width+"px; height:"+height+"px ;alignment:"+align+"; background-color:lightblue"+comment+"><a href="+comment+"http://www.cleverads.com"+comment+">Click here"+"</a></div>";
widgetCode.innerHTML = code;
} 

