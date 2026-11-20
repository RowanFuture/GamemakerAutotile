//Rowan's Autotile script!
//github.com/RowanFuture/GamemakerAutotile/

//order: right, ru, up, ul, left, ld, down dr,
global.built_in_tile_sequence_lookup47_ARRAY = [
	0b11111111,
	0b11101111,
	0b10111111,
	0b10101111,
	0b11111110,
	0b11101110,
	0b10111110,
	0b10101110,
	0b11111011,
	0b11101011,
	0b10111011,
	0b10101011,
	0b11111010,
	0b11101010,
	0b10111010,
	0b10101010,
	0b11100011,
	0b10100011,
	0b11100010,
	0b10100010,
	0b10001111,
	0b10001110,
	0b10001011,
	0b10001010,
	0b00111110,
	0b00111010,
	0b00101110,
	0b00101010,
	0b11111000,
	0b11101000,
	0b10111000,
	0b10101000,
	0b00100010,
	0b10001000,
	0b10000011,
	0b10000010,
	0b00001110,
	0b00001010,
	0b00111000,
	0b00101000,
	0b11100000,
	0b10100000,
	0b00000010,
	0b10000000,
	0b00100000,
	0b00001000,
	0b00000000,
];

global.built_in_tile_sequence_lookup16_ARRAY = [
	0b11111111, //center
	0b11101111, //inner corner ↖ 
	0b10111111, //inner corner ↗
	0b10001111, //edge ↑ 
	0b11111011, //inner corner ↙
	0b11100011, //edge ←
	0b01111011, //double corner ⤡
	0b10000011, //corner ↖
	0b11111110, //inner corner ↘
	0b11101110, //double corner ⤢
	0b00111110, //edge → 
	0b00001110, //corner ↗
	0b11111000, //edge ↓
	0b11100000, //corner ↙
	0b00111000, //corner ↘
	0b00000000, //empty
];

global.built_in_tile_sequence_lookup47 = ds_map_create();
for(var _i = 0; _i < array_length( global.built_in_tile_sequence_lookup47_ARRAY ); _i++){
	var _data = global.built_in_tile_sequence_lookup47_ARRAY[_i];
	ds_map_set(global.built_in_tile_sequence_lookup47, _data, _i);
}

global.built_in_tile_sequence_lookup16 = ds_map_create();
for(var _i = 0; _i < array_length( global.built_in_tile_sequence_lookup16_ARRAY ); _i++){
	var _data = global.built_in_tile_sequence_lookup16_ARRAY[_i];
	ds_map_set(global.built_in_tile_sequence_lookup16, _data, _i);
}

function get_autotile_from_sequence(_seq, _right, _rt, _top, _tl, _left, _ld, _down, _dr){
	
	var _build_lookup = (_right << 7) | ((_right && _rt && _top) << 6) | (_top << 5) | ((_top && _tl && _left) << 4) | (_left << 3) | ((_left && _ld && _down) << 2) | (_down << 1) | ((_down && _dr && _right) << 0);
	
	var _map = (array_length(_seq) <= 16 ? global.built_in_tile_sequence_lookup16 : global.built_in_tile_sequence_lookup47);
	var _index = _map[? _build_lookup];
	
	if(_index == undefined)
		return 0;
	
	var _val = _seq[_index];
		
	var _tile;
	if(is_array(_val)){
		_tile = _val[irandom(array_length(_val	)-1)];
	} else {
		_tile = _val;
	}
	
	return _tile;
}



global.SEQ_tl_example = [7,13,12,11,6,4,0,9,5,0,10,8,3,2,1,0];//replace with your tileset array

function get_autotile(_tileset_seq = global.SEQ_tl_example, _right, _rt, _top, _tl, _left, _ld, _down, _dr){
	
	var _seq = _tileset_seq;
	
	var _build_lookup = (_right << 7) | ((_right && _rt && _top) << 6) | (_top << 5) | ((_top && _tl && _left) << 4) | (_left << 3) | ((_left && _ld && _down) << 2) | (_down << 1) | ((_down && _dr && _right) << 0);
	
	var _map = (array_length(_seq) <= 16 ? global.built_in_tile_sequence_lookup16 : global.built_in_tile_sequence_lookup47);
	var _index = _map[? _build_lookup];
	
	if(_index == undefined)
		return 0;
	
	var _val = _seq[_index];
		
	var _tile;
	if(is_array(_val)){
		_tile = _val[irandom(array_length(_val	)-1)];
	} else {
		_tile = _val;
	}
	
	return _tile;
}
