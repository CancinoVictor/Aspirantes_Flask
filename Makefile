# Makefile para Flask (macOS/Linux)

.PHONY: help activate run stop install clean

PORT = 5001
APP = App.py

help:
	@echo "Comandos disponibles:"
	@echo "  make install     : Instala dependencias"
	@echo "  make activate    : Activa el entorno virtual"
	@echo "  make run         : Inicia el servidor Flask"
	@echo "  make stop        : Detiene el servidor"
	@echo "  make clean       : Elimina archivos temporales"

install:
	@echo "Instalando dependencias..."
	pip install -r requirements.txt

activate:
	@echo "Activando entorno virtual..."
	bash -c 'source venv/bin/activate && exec bash'
run:
	@echo "Iniciando servidor Flask en http://localhost:$(PORT)..."
	export FLASK_APP=$(APP) && \
	export FLASK_ENV=development && \
	flask run --debug -p $(PORT)

stop:
	@echo "Deteniendo servidor..."
	kill -9 $$(lsof -t -i:$(PORT)) || true

clean:
	@echo "Limpiando archivos temporales..."
	find . -type d -name "__pycache__" -exec rm -rf {} +