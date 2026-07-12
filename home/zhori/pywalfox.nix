
{ pkgs, inputs, ... }:

{

	home.file.".mozilla/native-messaging-hosts/pywalfox.json".text = ''
	{
		"name": "pywalfox",
			"description": "Pywalfox native messaging host",
			"path": "${pkgs.pywalfox-native}/bin/pywalfox",
			"type": "stdio",
			"allowed_extensions": [
				"pywalfox@frewacom.org"
			]
	}
	'';

}

