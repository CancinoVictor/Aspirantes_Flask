from datetime import datetime
from model.package_model.Aspirantes import Aspirantes

# Datos de prueba
rfc = 'PETD740714852'
nom = 'David'
pat = 'Perez'
mat = 'Tinoco'
id_emp = 2
tel = 1234567890
ema = 'slaspage@hotmail.com'
f_reg = datetime.now()

# Validar el RFC antes de continuar
if len(rfc) == 13 and rfc.isalnum():
    cuantos = Aspirantes.existe_aspirante(rfc)

    if cuantos == 0:
        obj_aspirante = Aspirantes()
        aspirante = Aspirantes(rfc, nom, pat, mat, id_emp, tel, ema, f_reg)
        
        try:
            result_ins = obj_aspirante.insertar_aspirante(aspirante)
            
            if result_ins == '1':
                print("✅ Registro insertado correctamente")
            else:
                print("❌ Error: Registro no insertado correctamente")
        
        except Exception as e:
            print(f"⚠️ Error al insertar: {e}")
    
    else:
        print("⚠️ El RFC ya existe en la base de datos.")

else:
    print("❌ Error: El RFC debe tener 13 caracteres alfanuméricos.")
