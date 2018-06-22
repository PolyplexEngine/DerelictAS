module derelict.angelscript.ascpp;
import derelict.angelscript.types;

private {
	import core.stdc.config;
	import std.stdio;
	import derelict.util.loader;
	import derelict.util.system;

	static if(Derelict_OS_Windows)
		enum libNames = "angelscript.dll";
	else static if(Derelict_OS_Mac)
		enum libNames = "libangelscript.dylib";
	else static if(Derelict_OS_Posix)
		enum libNames = "libangelscript.so,/usr/local/lib/libangelscript.so";
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
	// engine
	alias da_asCreateScriptEngine = asIScriptEngine* function(asDWORD);
	alias da_asGetLibraryVersion = const(char*) function();
	alias da_asGetLibraryOptions = const(char*) function();

	// context
	alias da_asGetActiveContext = asIScriptContext* function();

	// threading
	alias da_asPrepareMultithread = int function(asIThreadManager*);
	alias da_asUnprepareMultithread = void function();
	alias da_asGetThreadManager = asIThreadManager* function();
	alias da_asAcquireExclusiveLock = void function();
	alias da_asReleaseExclusiveLock = void function();
	alias da_asAcquireSharedLock = void function();
	alias da_asReleaseSharedLock = void function();
	alias da_asAtomicInc = int function(ref int);
	alias da_asAtomicDec = int function(ref int);
	alias da_asThreadCleanup = int function();

	// memory managment
	alias da_asSetGlobalMemoryFunctions = int function(asALLOCFUNC_t, asFREEFUNC_t);
	alias da_asResetGlobalMemoryFunctions = int function();
	alias da_asAllocMem = void* function(size_t);
	alias da_asFreeMem = void function(void*);

	// aux
	alias da_asCreateLockableSharedBool = asILockableSharedBool* function();
}

__gshared {
	da_asCreateScriptEngine asCreateScriptEngine;
	da_asGetLibraryVersion asGetLibraryVersion;
	da_asGetLibraryOptions asGetLibraryOptions;

	da_asGetActiveContext asGetActiveContext;

	da_asPrepareMultithread asPrepareMultithread;
	da_asUnprepareMultithread asUnprepareMultithread;
	da_asGetThreadManager asGetThreadManager;
	da_asAcquireExclusiveLock asAcquireExclusiveLock;
	da_asReleaseExclusiveLock asReleaseExclusiveLock;
	da_asAcquireSharedLock asAcquireSharedLock;
	da_asReleaseSharedLock asReleaseSharedLock;
	da_asAtomicInc asAtomicInc;
	da_asAtomicDec asAtomicDec;
	da_asThreadCleanup asThreadCleanup;

	da_asSetGlobalMemoryFunctions asSetGlobalMemoryFunctions;
	da_asResetGlobalMemoryFunctions asResetGlobalMemoryFunctions;
	da_asAllocMem asAllocMem;
	da_asFreeMem asFreeMem;

	da_asCreateLockableSharedBool asCreateLockableSharedBool;
}

public class DerelictAngelscriptCPPLoader : SharedLibLoader {
	public this() {
		super(libNames);
	}

	public this(string names) {
		super(names);
	}

	protected override void loadSymbols() {
		bindFunc(cast(void**)&asCreateScriptEngine, "asCreateScriptEngine");
		bindFunc(cast(void**)&asGetLibraryVersion, "asGetLibraryVersion");
		bindFunc(cast(void**)&asGetLibraryOptions, "asGetLibraryOptions");
		bindFunc(cast(void**)&asGetActiveContext, "asGetActiveContext");
		bindFunc(cast(void**)&asPrepareMultithread, "asPrepareMultithread");
		bindFunc(cast(void**)&asUnprepareMultithread, "asUnprepareMultithread");
		bindFunc(cast(void**)&asGetThreadManager, "asGetThreadManager");
		bindFunc(cast(void**)&asAcquireExclusiveLock, "asAcquireExclusiveLock");
		bindFunc(cast(void**)&asReleaseExclusiveLock, "asReleaseExclusiveLock");
		bindFunc(cast(void**)&asAcquireSharedLock, "asAcquireSharedLock");
		bindFunc(cast(void**)&asReleaseSharedLock, "asReleaseSharedLock");
		bindFunc(cast(void**)&asAtomicInc, "asAtomicInc");
		bindFunc(cast(void**)&asAtomicDec, "asAtomicDec");
		bindFunc(cast(void**)&asThreadCleanup, "asThreadCleanup");
		bindFunc(cast(void**)&asSetGlobalMemoryFunctions, "asSetGlobalMemoryFunctions");
		bindFunc(cast(void**)&asResetGlobalMemoryFunctions, "asResetGlobalMemoryFunctions");
		bindFunc(cast(void**)&asAllocMem, "asAllocMem");
		bindFunc(cast(void**)&asFreeMem, "asFreeMem");
		bindFunc(cast(void**)&asCreateLockableSharedBool, "asCreateLockableSharedBool");
	}
}

__gshared DerelictAngelscriptCPPLoader DerelictAngelscriptCPP;

shared static this() {
	DerelictAngelscriptCPP = new DerelictAngelscriptCPPLoader();
}