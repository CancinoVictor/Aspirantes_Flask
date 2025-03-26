import pymysql
import logging
import os

logging.basicConfig(level=logging.INFO)

class DB:
    def __init__(self):
        self.conn = None
        self.cursor = None
        try:
            self.conn = pymysql.connect(
                host=os.getenv("MYSQL_HOST", "localhost"),  # Cambiado de 'localhost' a 'mysql'
                port=int(os.getenv("MYSQL_PORT", 3306)),  # Puerto como variable de entorno
                user=os.getenv("MYSQL_USER", "root"),
                password=os.getenv("MYSQL_PASSWORD", "23731497"),
                db=os.getenv("MYSQL_DATABASE", "db_cursos"),
                charset='utf8'
            )
            self.cursor = self.conn.cursor()
            logging.info("✅ Conexión a la base de datos establecida correctamente.")
        except Exception as e:
            logging.error(f"❌ Error al conectar a la base de datos: {e}")
            self.conn = None
            self.cursor = None

    def get_cursor(self):
        """Devuelve un cursor si la conexión está activa, o None si no lo está."""
        if self.conn:
            logging.info("🔄 Cursor obtenido correctamente.")
            return self.conn.cursor()
        else:
            logging.error("⚠️ Intento de obtener cursor sin conexión activa.")
            return None

    def close(self):
        """Cierra el cursor y la conexión de manera segura."""
        try:
            if self.cursor:
                self.cursor.close()
            if self.conn:
                self.conn.close()
            logging.info("🔒 Conexión cerrada correctamente.")
        except Exception as e:
            logging.error(f"❌ Error al cerrar la conexión: {e}")
