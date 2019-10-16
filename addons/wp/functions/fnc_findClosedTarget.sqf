#include "script_component.hpp"
// Find Closed Target to Group
// version 3.6
// by jokoho482

params ["_group", "_radius"];
private _newdist = _radius;
private _players = (switchableUnits + playableUnits - entities "HeadlessClient_F");
_players = _players select {side _x != side _group && {side _x != civilian}};
private _target = objNull;
{
    private _dist = (leader _group) distance2d _x;
    if (_dist < _newdist && {(getPosATL _x) select 2 < 200}) then { _target = _x; _newdist = _dist; };
    true
} count _players;
_target