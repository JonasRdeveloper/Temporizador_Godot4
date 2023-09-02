extends Label

var Rodando: bool = false
var Tempo_decorrido: float = 0.0
var Horas_decorridas: int = 0
var LabelDestaqueTempo: Label

func _ready():
	LabelDestaqueTempo = get_node("LabelDestaqueTempo")  # Assumindo que o rótulo está na mesma cena

func _process(delta):
	if Rodando:
		Tempo_decorrido += delta
		Atualizar_tempo()

func Atualizar_tempo():
	var total_seconds = float(Tempo_decorrido)
	var Horas = int(total_seconds / 3600)
	var total_seconds_without_hours = total_seconds - (Horas * 3600)
	var Minutos = int(total_seconds_without_hours / 60)
	var seconds = total_seconds_without_hours - (Minutos * 60)

	var Texto_horas = "%02d" % Horas
	var Texto_minutos = "%02d" % Minutos
	var Texto_segundos = "%02d" % seconds

	text = Texto_horas + ":" + Texto_minutos + ":" + Texto_segundos

func Iniciar_tempo():
	if not Rodando:
		Rodando = true

func Parar_tempo():
	if Rodando:
		Rodando = false

func Resetar_tempo():
	Rodando = false
	Tempo_decorrido = 0.0
	Horas_decorridas = 0
	Atualizar_tempo()

func Destacar_tempo_selecionado():
	var total_seconds = float(Tempo_decorrido)
	var Horas = int(total_seconds / 3600)
	var total_seconds_without_hours = total_seconds - (Horas * 3600)
	var Minutos = int(total_seconds_without_hours / 60)
	var seconds = int(total_seconds_without_hours - (Minutos * 60))

	var Texto_destaque = "Tempo selecionado: " + str(Horas) + " horas, " + str(Minutos) + " minutos, " + str(seconds) + " segundos"

	# Atualiza o rótulo com o tempo destacado
	LabelDestaqueTempo.text = Texto_destaque

func _on_button_pressed():
	Iniciar_tempo()

func _on_parar_cronometragem_pressed():
	Parar_tempo()

func _on_reiniciar_cronometragem_pressed():
	Resetar_tempo()

func _on_destacar_tempo_button_pressed():
	Destacar_tempo_selecionado()
	
	
	
