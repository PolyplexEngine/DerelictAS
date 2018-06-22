module derelict.angelscript;

public import derelict.angelscript.asc;
public import derelict.angelscript.ascpp;
public import derelict.angelscript.types;

public class DerelictAngelscriptLoader {
	public void load() {
		DerelictAngelscriptC.load();
		DerelictAngelscriptCPP.load();
	}

	public void load(string path, string pathcpp) {
		DerelictAngelscriptC.load(path);
		DerelictAngelscriptCPP.load(pathcpp);
	}
}

__gshared DerelictAngelscriptLoader DerelictAngelscript;

shared static this() {
	DerelictAngelscript = new DerelictAngelscriptLoader();
}