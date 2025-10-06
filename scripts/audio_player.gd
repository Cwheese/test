extends AudioStreamPlayer

var level_music = preload("res://music/Light-Ambience-2.ogg")
var npc_house_world2_music = preload("res://music/Ambient-1.ogg")
var castle_music = preload("res://music/Ambient-9.ogg")
var king_castle = preload("res://music/Light-Ambience-1.ogg")

func _ready():
	level_music.loop = true
	npc_house_world2_music.loop = true
	castle_music.loop = true
	king_castle.loop = true
	
func _play_music(music: AudioStream, volume: float = 0.0):  # Changed parameter type to AudioStream
	if stream == music:
		return
		
	stream = music  # This is now correctly an AudioStream
	volume_db = volume
	play()
	
func _castle():
	_play_music(castle_music)

func _npc_and_world_2():
	_play_music(npc_house_world2_music)
	
func _play_music_level():
	_play_music(level_music)  # Passing the AudioStream directly here
	
func _inside_castle():
	_play_music(king_castle) 
	
func play_FX(stream: AudioStream,  volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	fx_player.queue_free()
