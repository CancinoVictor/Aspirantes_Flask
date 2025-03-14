import pymysql
from model.package_model.Database import DB
from flask import jsonify

class Aspirantes:
    def __init__(self, rfc='', nombre='', paterno='', materno='', id_empresa=0, telefono=0, email='', fecha_registro=''):
        self.__rfc = rfc
        self.__nombre = nombre
        self.__paterno = paterno
        self.__materno = materno
        self.__id_empresa = id_empresa
        self.__telefono = telefono
        self.__email = email
        self.__fecha_registro = fecha_registro

    @staticmethod
    def existe_aspirante(rfc):
        conexion = DB()
        cursor = conexion.get_cursor()
        if cursor:
            cursor.execute("SELECT COUNT(*) FROM aspirantes WHERE RFC = %s", (rfc,))
            aspirante = cursor.fetchone()
            conexion.close()
            return aspirante[0] if aspirante else 0
        return 0  # Retornar 0 si hay un error de conexión

    def insertar_aspirante(self, obj_asp):
        conexion = DB()
        cursor = conexion.get_cursor()
        if not cursor:
            return "Error de conexión a la base de datos"

        try:
            query = """
                INSERT INTO aspirantes (RFC, NOMBRE, PATERNO, MATERNO, ID_EMPRESA, TELEFONO, EMAIL, FECHA_REGISTRO)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """
            vals = (obj_asp.__rfc, obj_asp.__nombre, obj_asp.__paterno, obj_asp.__materno,
                    obj_asp.__id_empresa, obj_asp.__telefono, obj_asp.__email, obj_asp.__fecha_registro)

            cursor.execute(query, vals)
            conexion.conn.commit()
            return str(cursor.rowcount)
        except pymysql.err.ProgrammingError as e:
            return f"Error de SQL: {e}"
        except Exception as e:
            return f"Error inesperado: {e}"
        finally:
            conexion.close()

    def eliminar_aspirante(self, rfc):
        conexion = DB()
        cursor = conexion.get_cursor()
        if not cursor:
            return "Error de conexión a la base de datos"

        affected = cursor.execute("DELETE FROM aspirantes WHERE RFC = %s", (rfc,))
        conexion.conn.commit()
        conexion.close()
        return affected

    def actualizar_aspirante(self, obj_asp):
        conexion = DB()
        cursor = conexion.get_cursor()
        if not cursor:
            return "Error de conexión a la base de datos"

        affected = cursor.execute("""
            UPDATE aspirantes 
            SET ID_EMPRESA = %s, NOMBRE = %s, PATERNO = %s, MATERNO = %s, 
                TELEFONO = %s, EMAIL = %s, FECHA_REGISTRO = %s 
            WHERE RFC = %s
        """, (obj_asp.__id_empresa, obj_asp.__nombre, obj_asp.__paterno, obj_asp.__materno,
              obj_asp.__telefono, obj_asp.__email, obj_asp.__fecha_registro, obj_asp.__rfc))

        conexion.conn.commit()
        conexion.close()
        return affected

    def obtener_aspirantes(self):
        conexion = DB()
        cursor = conexion.get_cursor()
        if not cursor:
            return []

        cursor.execute("SELECT * FROM aspirantes")
        aspirantes = cursor.fetchall()
        conexion.close()
        return aspirantes

    @staticmethod
    def obtener_aspirante_por_rfc(rfc):
        conexion = DB()
        cursor = conexion.get_cursor()
        if not cursor:
            return None

        cursor.execute("SELECT * FROM aspirantes WHERE RFC = %s", (rfc,))
        aspirante = cursor.fetchone()
        conexion.close()
        return aspirante
