module derelict.angelscript.asc;
import derelict.angelscript.types;

private {
	import core.stdc.config;
	import std.stdio;
	import derelict.util.loader;
	import derelict.util.system;

	static if(Derelict_OS_Windows)
		enum libNames = "as_c.dll";
	else static if(Derelict_OS_Mac)
		enum libNames = "libas_c.dylib";
	else static if(Derelict_OS_Posix)
		enum libNames = "libas_c.so";
	else
		static assert(0, "Need to implement libangelscript libnames for this operating system.");
	
	//Redfine the vtypes here, else it doesn't compile
	alias asBYTE = ubyte;
	alias asWORD = ushort;
	alias asUINT = uint;
	alias asPWORD = size_t;
	static if ((void*).sizeof == long.sizeof) {
		alias asDWORD = uint;
		alias asQWORD = ulong;
		alias asINT64 = long;
	} else {
		alias asDWORD = ulong;
		// TODO: Implement __GNUC__/__MWERKS__ from angelscript_c.h
		// TODO: Implement else part of that.
	}
}

extern (C) @nogc nothrow {
	// --- script engine

	// memory managment
	alias da_asEngine_AddRef = int function(asIScriptEngine*);
	alias da_asEngine_Release = int function(asIScriptEngine*);
	alias da_asEngine_ShutDownAndRelease = int function(asIScriptEngine*);

	// engine properties
	alias da_asEngine_SetEngineProperty = int function(asIScriptEngine*, asEEngineProp, asPWORD);
	alias da_asEngine_GetEngineProperty = asPWORD function(asIScriptEngine*, asEEngineProp);

	// compiler messages
	alias da_asEngine_SetMessageCallback = int function(asIScriptEngine*, asFUNCTION_t, void*, asDWORD);
	alias da_asEngine_ClearMessageCallback = int function(asIScriptEngine*);
	alias da_asEngine_WriteMessage = int function(asIScriptEngine*, const(char*), int, int, asEMsgType, const(char*));

	// jit compiler
	alias da_asEngine_SetJITCompiler = int function(asIScriptEngine*, asIJITCompiler*);
	alias da_asEngine_GetJITCompiler = asIJITCompiler* function(asIScriptEngine*);

	// global functions
	alias da_asEngine_RegisterGlobalFunction = int function(asIScriptEngine*, const(char*), asFUNCTION_t, asDWORD, void*);
	alias da_asEngine_GetGlobalFunctionCount = asUINT function(asIScriptEngine*);
	alias da_asEngine_GetGlobalFunctionByIndex = asIScriptFunction* function(asIScriptEngine*, asUINT);
	alias da_asEngine_GetGlobalFunctionByDecl = asIScriptFunction* function(asIScriptEngine*, const(char*));

	alias da_asEngine_CreateContext = asIScriptContext* function(asIScriptEngine*);
	alias da_asEngine_GetModule = asIScriptModule* function(asIScriptEngine*, const(char*));

	alias da_asContext_Release = int function(asIScriptContext*);
	alias da_asContext_Prepare = int function(asIScriptContext*, asIScriptFunction*);
	alias da_asContext_Execute = int function(asIScriptContext*);
	
	alias da_asModule_Release = int function(asIScriptModule*);
	alias da_asModule_GetFunctionByDecl = asIScriptFunction* function(asIScriptModule*, const(char*));

	alias da_asScript_Release = int function(asIScriptFunction*);
	//alias da_asEngine_ExecuteString()

	// global properties
	/*
		TODO: Define all functions
	alias da_asEngine_ = int function(asIScriptEngine*,);
	alias da_asEngine_ = asUINT function(asIScriptEngine*,);
	alias da_asEngine_ = int function(asIScriptEngine*,);
	alias da_asEngine_ = int function(asIScriptEngine*,);
	alias da_asEngine_ = int function(asIScriptEngine*,);


	alias da_asEngine_ = int function(asIScriptEngine*,);



	alias da_as = void function();*/
}

__gshared {
	da_asEngine_AddRef asEngine_AddRef;
	da_asEngine_Release asEngine_Release;
	da_asEngine_ShutDownAndRelease asEngine_ShutDownAndRelease;

	da_asEngine_SetEngineProperty asEngine_SetEngineProperty;
	da_asEngine_GetEngineProperty asEngine_GetEngineProperty;

	da_asEngine_SetMessageCallback asEngine_SetMessageCallback;
	da_asEngine_ClearMessageCallback asEngine_ClearMessageCallback;
	da_asEngine_WriteMessage asEngine_WriteMessage;

	da_asEngine_SetJITCompiler asEngine_SetJITCompiler;
	da_asEngine_GetJITCompiler asEngine_GetJITCompiler;

	da_asEngine_RegisterGlobalFunction asEngine_RegisterGlobalFunction;
	da_asEngine_GetGlobalFunctionCount asEngine_GetGlobalFunctionCount;
	da_asEngine_GetGlobalFunctionByIndex asEngine_GetGlobalFunctionByIndex;
	da_asEngine_GetGlobalFunctionByDecl asEngine_GetGlobalFunctionByDecl;

	da_asEngine_CreateContext asEngine_CreateContext;
	da_asEngine_GetModule asEngine_GetModule;

	da_asContext_Release asContext_Release;
	da_asContext_Prepare asContext_Prepare;
	da_asContext_Execute asContext_Execute;

	da_asModule_GetFunctionByDecl asModule_GetFunctionByDecl;
}

public class DerelictAngelscriptLoader : SharedLibLoader {
	public this() {
		super(libNames);
	}

	public this(string names) {
		super(names);
	}

	protected override void loadSymbols() {
		bindFunc(cast(void**)&asEngine_AddRef, "asEngine_AddRef");
		bindFunc(cast(void**)&asEngine_Release, "asEngine_Release");
		bindFunc(cast(void**)&asEngine_ShutDownAndRelease, "asEngine_ShutDownAndRelease");
		bindFunc(cast(void**)&asEngine_SetEngineProperty, "asEngine_SetEngineProperty");
		bindFunc(cast(void**)&asEngine_GetEngineProperty, "asEngine_GetEngineProperty");
		bindFunc(cast(void**)&asEngine_SetMessageCallback, "asEngine_SetMessageCallback");
		bindFunc(cast(void**)&asEngine_ClearMessageCallback, "asEngine_ClearMessageCallback");
		bindFunc(cast(void**)&asEngine_WriteMessage, "asEngine_WriteMessage");
		bindFunc(cast(void**)&asEngine_SetJITCompiler, "asEngine_SetJITCompiler");
		bindFunc(cast(void**)&asEngine_GetJITCompiler, "asEngine_GetJITCompiler");
		bindFunc(cast(void**)&asEngine_RegisterGlobalFunction, "asEngine_RegisterGlobalFunction");
		bindFunc(cast(void**)&asEngine_GetGlobalFunctionCount, "asEngine_GetGlobalFunctionCount");
		bindFunc(cast(void**)&asEngine_GetGlobalFunctionByIndex, "asEngine_GetGlobalFunctionByIndex");
		bindFunc(cast(void**)&asEngine_GetGlobalFunctionByDecl, "asEngine_GetGlobalFunctionByDecl");

		bindFunc(cast(void**)&asEngine_CreateContext, "asEngine_CreateContext");
		bindFunc(cast(void**)&asEngine_GetModule, "asEngine_GetModule");

		bindFunc(cast(void**)&asContext_Release, "asContext_Release");
		bindFunc(cast(void**)&asContext_Prepare, "asContext_Prepare");
		bindFunc(cast(void**)&asContext_Execute, "asContext_Execute");

		bindFunc(cast(void**)&asModule_GetFunctionByDecl, "asModule_GetFunctionByDecl");
	}
}

__gshared DerelictAngelscriptLoader DerelictAngelscript;

shared static this() {
	DerelictAngelscript = new DerelictAngelscriptLoader();
}