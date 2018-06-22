module derelict.angelscript;

public import derelict.angelscript.asc;
public import derelict.angelscript.ascpp;

enum asERetCodes {
	asSUCCESS                              =  0,
	asERROR                                = -1,
	asCONTEXT_ACTIVE                       = -2,
	asCONTEXT_NOT_FINISHED                 = -3,
	asCONTEXT_NOT_PREPARED                 = -4,
	asINVALID_ARG                          = -5,
	asNO_FUNCTION                          = -6,
	asNOT_SUPPORTED                        = -7,
	asINVALID_NAME                         = -8,
	asNAME_TAKEN                           = -9,
	asINVALID_DECLARATION                  = -10,
	asINVALID_OBJECT                       = -11,
	asINVALID_TYPE                         = -12,
	asALREADY_REGISTERED                   = -13,
	asMULTIPLE_FUNCTIONS                   = -14,
	asNO_MODULE                            = -15,
	asNO_GLOBAL_VAR                        = -16,
	asINVALID_CONFIGURATION                = -17,
	asINVALID_INTERFACE                    = -18,
	asCANT_BIND_ALL_FUNCTIONS              = -19,
	asLOWER_ARRAY_DIMENSION_NOT_REGISTERED = -20,
	asWRONG_CONFIG_GROUP                   = -21,
	asCONFIG_GROUP_IS_IN_USE               = -22,
	asILLEGAL_BEHAVIOUR_FOR_TYPE           = -23,
	asWRONG_CALLING_CONV                   = -24,
	asBUILD_IN_PROGRESS                    = -25,
	asINIT_GLOBAL_VARS_FAILED              = -26,
	asOUT_OF_MEMORY                        = -27,
	asMODULE_IS_IN_USE                     = -28
}

enum asEEngineProp {
	asEP_ALLOW_UNSAFE_REFERENCES            = 1,
	asEP_OPTIMIZE_BYTECODE                  = 2,
	asEP_COPY_SCRIPT_SECTIONS               = 3,
	asEP_MAX_STACK_SIZE                     = 4,
	asEP_USE_CHARACTER_LITERALS             = 5,
	asEP_ALLOW_MULTILINE_STRINGS            = 6,
	asEP_ALLOW_IMPLICIT_HANDLE_TYPES        = 7,
	asEP_BUILD_WITHOUT_LINE_CUES            = 8,
	asEP_INIT_GLOBAL_VARS_AFTER_BUILD       = 9,
	asEP_REQUIRE_ENUM_SCOPE                 = 10,
	asEP_SCRIPT_SCANNER                     = 11,
	asEP_INCLUDE_JIT_INSTRUCTIONS           = 12,
	asEP_STRING_ENCODING                    = 13,
	asEP_PROPERTY_ACCESSOR_MODE             = 14,
	asEP_EXPAND_DEF_ARRAY_TO_TMPL           = 15,
	asEP_AUTO_GARBAGE_COLLECT               = 16,
	asEP_DISALLOW_GLOBAL_VARS               = 17,
	asEP_ALWAYS_IMPL_DEFAULT_CONSTRUCT      = 18,
	asEP_COMPILER_WARNINGS                  = 19,
	asEP_DISALLOW_VALUE_ASSIGN_FOR_REF_TYPE = 20,
	asEP_ALTER_SYNTAX_NAMED_ARGS            = 21,
	asEP_DISABLE_INTEGER_DIVISION           = 22,
	asEP_DISALLOW_EMPTY_LIST_ELEMENTS       = 23,
	asEP_PRIVATE_PROP_AS_PROTECTED          = 24,
	asEP_ALLOW_UNICODE_IDENTIFIERS          = 25,
	asEP_HEREDOC_TRIM_MODE                  = 26,

	asEP_LAST_PROPERTY
}

enum asECallConvTypes {
	asCALL_CDECL             = 0,
	asCALL_STDCALL           = 1,
	asCALL_THISCALL_ASGLOBAL = 2,
	asCALL_THISCALL          = 3,
	asCALL_CDECL_OBJLAST     = 4,
	asCALL_CDECL_OBJFIRST    = 5,
	asCALL_GENERIC           = 6,
	asCALL_THISCALL_OBJLAST  = 7,
	asCALL_THISCALL_OBJFIRST = 8
}

enum asEObjTypeFlags {
	asOBJ_REF                        = (1<<0),
	asOBJ_VALUE                      = (1<<1),
	asOBJ_GC                         = (1<<2),
	asOBJ_POD                        = (1<<3),
	asOBJ_NOHANDLE                   = (1<<4),
	asOBJ_SCOPED                     = (1<<5),
	asOBJ_TEMPLATE                   = (1<<6),
	asOBJ_ASHANDLE                   = (1<<7),
	asOBJ_APP_CLASS                  = (1<<8),
	asOBJ_APP_CLASS_CONSTRUCTOR      = (1<<9),
	asOBJ_APP_CLASS_DESTRUCTOR       = (1<<10),
	asOBJ_APP_CLASS_ASSIGNMENT       = (1<<11),
	asOBJ_APP_CLASS_COPY_CONSTRUCTOR = (1<<12),
	asOBJ_APP_CLASS_C                = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_CONSTRUCTOR),
	asOBJ_APP_CLASS_CD               = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_CONSTRUCTOR + asOBJ_APP_CLASS_DESTRUCTOR),
	asOBJ_APP_CLASS_CA               = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_CONSTRUCTOR + asOBJ_APP_CLASS_ASSIGNMENT),
	asOBJ_APP_CLASS_CK               = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_CONSTRUCTOR + asOBJ_APP_CLASS_COPY_CONSTRUCTOR),
	asOBJ_APP_CLASS_CDA              = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_CONSTRUCTOR + asOBJ_APP_CLASS_DESTRUCTOR + asOBJ_APP_CLASS_ASSIGNMENT),
	asOBJ_APP_CLASS_CDK              = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_CONSTRUCTOR + asOBJ_APP_CLASS_DESTRUCTOR + asOBJ_APP_CLASS_COPY_CONSTRUCTOR),
	asOBJ_APP_CLASS_CAK              = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_CONSTRUCTOR + asOBJ_APP_CLASS_ASSIGNMENT + asOBJ_APP_CLASS_COPY_CONSTRUCTOR),
	asOBJ_APP_CLASS_CDAK             = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_CONSTRUCTOR + asOBJ_APP_CLASS_DESTRUCTOR + asOBJ_APP_CLASS_ASSIGNMENT + asOBJ_APP_CLASS_COPY_CONSTRUCTOR),
	asOBJ_APP_CLASS_D                = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_DESTRUCTOR),
	asOBJ_APP_CLASS_DA               = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_DESTRUCTOR + asOBJ_APP_CLASS_ASSIGNMENT),
	asOBJ_APP_CLASS_DK               = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_DESTRUCTOR + asOBJ_APP_CLASS_COPY_CONSTRUCTOR),
	asOBJ_APP_CLASS_DAK              = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_DESTRUCTOR + asOBJ_APP_CLASS_ASSIGNMENT + asOBJ_APP_CLASS_COPY_CONSTRUCTOR),
	asOBJ_APP_CLASS_A                = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_ASSIGNMENT),
	asOBJ_APP_CLASS_AK               = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_ASSIGNMENT + asOBJ_APP_CLASS_COPY_CONSTRUCTOR),
	asOBJ_APP_CLASS_K                = (asOBJ_APP_CLASS + asOBJ_APP_CLASS_COPY_CONSTRUCTOR),
	asOBJ_APP_PRIMITIVE              = (1<<13),
	asOBJ_APP_FLOAT                  = (1<<14),
	asOBJ_APP_ARRAY                  = (1<<15),
	asOBJ_APP_CLASS_ALLINTS          = (1<<16),
	asOBJ_APP_CLASS_ALLFLOATS        = (1<<17),
	asOBJ_NOCOUNT                    = (1<<18),
	asOBJ_APP_CLASS_ALIGN8           = (1<<19),
	asOBJ_IMPLICIT_HANDLE            = (1<<20),
	asOBJ_MASK_VALID_FLAGS           = 0x1FFFFF,

	asOBJ_SCRIPT_OBJECT              = (1<<21),
	asOBJ_SHARED                     = (1<<22),
	asOBJ_NOINHERIT                  = (1<<23),
	asOBJ_FUNCDEF                    = (1<<24),
	asOBJ_LIST_PATTERN               = (1<<25),
	asOBJ_ENUM                       = (1<<26),
	asOBJ_TEMPLATE_SUBTYPE           = (1<<27),
	asOBJ_TYPEDEF                    = (1<<28),
	asOBJ_ABSTRACT                   = (1<<29),
	asOBJ_APP_ALIGN16                = (1<<30)
}

enum asEBehaviours {
	asBEHAVE_CONSTRUCT,
	asBEHAVE_LIST_CONSTRUCT,
	asBEHAVE_DESTRUCT,

	asBEHAVE_FACTORY,
	asBEHAVE_LIST_FACTORY,
	asBEHAVE_ADDREF,
	asBEHAVE_RELEASE,
	asBEHAVE_GET_WEAKREF_FLAG,

	asBEHAVE_TEMPLATE_CALLBACK,

	asBEHAVE_FIRST_GC,
	 asBEHAVE_GETREFCOUNT = asBEHAVE_FIRST_GC,
	 asBEHAVE_SETGCFLAG,
	 asBEHAVE_GETGCFLAG,
	 asBEHAVE_ENUMREFS,
	 asBEHAVE_RELEASEREFS,
	asBEHAVE_LAST_GC = asBEHAVE_RELEASEREFS,

	asBEHAVE_MAX
}

enum asEMsgType {
	asMSGTYPE_ERROR       = 0,
	asMSGTYPE_WARNING     = 1,
	asMSGTYPE_INFORMATION = 2
}

enum asEContextState {
	asEXECUTION_FINISHED      = 0,
	asEXECUTION_SUSPENDED     = 1,
	asEXECUTION_ABORTED       = 2,
	asEXECUTION_EXCEPTION     = 3,
	asEXECUTION_PREPARED      = 4,
	asEXECUTION_UNINITIALIZED = 5,
	asEXECUTION_ACTIVE        = 6,
	asEXECUTION_ERROR         = 7
}

enum asEGCFlags {
	asGC_FULL_CYCLE      = 1,
	asGC_ONE_STEP        = 2,
	asGC_DESTROY_GARBAGE = 4,
	asGC_DETECT_GARBAGE  = 8
}

enum asETokenClass {
	asTC_UNKNOWN    = 0,
	asTC_KEYWORD    = 1,
	asTC_VALUE      = 2,
	asTC_IDENTIFIER = 3,
	asTC_COMMENT    = 4,
	asTC_WHITESPACE = 5
}

enum asETypeIdFlags {
	asTYPEID_VOID           = 0,
	asTYPEID_BOOL           = 1,
	asTYPEID_INT8           = 2,
	asTYPEID_INT16          = 3,
	asTYPEID_INT32          = 4,
	asTYPEID_INT64          = 5,
	asTYPEID_UINT8          = 6,
	asTYPEID_UINT16         = 7,
	asTYPEID_UINT32         = 8,
	asTYPEID_UINT64         = 9,
	asTYPEID_FLOAT          = 10,
	asTYPEID_DOUBLE         = 11,
	asTYPEID_OBJHANDLE      = 0x40000000,
	asTYPEID_HANDLETOCONST  = 0x20000000,
	asTYPEID_MASK_OBJECT    = 0x1C000000,
	asTYPEID_APPOBJECT      = 0x04000000,
	asTYPEID_SCRIPTOBJECT   = 0x08000000,
	asTYPEID_TEMPLATE       = 0x10000000,
	asTYPEID_MASK_SEQNBR    = 0x03FFFFFF
}

enum asETypeModifiers {
	asTM_NONE     = 0,
	asTM_INREF    = 1,
	asTM_OUTREF   = 2,
	asTM_INOUTREF = 3,
	asTM_CONST    = 4
}

enum asEGMFlags {
	asGM_ONLY_IF_EXISTS       = 0,
	asGM_CREATE_IF_NOT_EXISTS = 1,
	asGM_ALWAYS_CREATE        = 2
}

enum asECompileFlags {
	asCOMP_ADD_TO_MODULE = 1
}

enum asEFuncType {
	asFUNC_DUMMY     =-1,
	asFUNC_SYSTEM    = 0,
	asFUNC_SCRIPT    = 1,
	asFUNC_INTERFACE = 2,
	asFUNC_VIRTUAL   = 3,
	asFUNC_FUNCDEF   = 4,
	asFUNC_IMPORTED  = 5,
	asFUNC_DELEGATE  = 6
}

enum asBOOL {
	asTRUE = 1,
	asFALSE = 0
}

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


struct asSMessageInfo {
	const char *section;
	int         row;
	int         col;
	asEMsgType  type;
	const char *message;
}

struct asIScriptEngine;
struct asIScriptModule;
struct asIScriptContext;
struct asIScriptGeneric;
struct asIScriptObject;
struct asITypeInfo;
struct asIScriptFunction;
struct asIBinaryStream;
struct asIJITCompiler;
struct asIThreadManager;
struct asILockableSharedBool;

alias asBINARYREADFUNC_t = void function(void*, asUINT, void*);
alias asBINARYWRITEFUNC_t = void function(const(void*), asUINT, void*);
alias asFUNCTION_t = void function();
alias asGENFUNC_t = void function(asIScriptGeneric*);
alias asALLOCFUNC_t = void* function(size_t);
alias asFREEFUNC_t = void function(void*);
alias asCLEANENGINEFUNC_t = void function(asIScriptEngine*);
alias asCLEANMODULEFUNC_t = void function(asIScriptModule*);
alias asCLEANCONTEXTFUNC_t = void function(asIScriptContext*);
alias asCLEANFUNCTIONFUNC_t = void function(asIScriptFunction*);
alias asCLEANTYPEINFOFUNC_t = void function(asITypeInfo*);
alias asCLEANSCRIPTOBJECTFUNC_t = void function(asIScriptObject*);
alias asREQUESTCONTEXTFUNC_t = asIScriptContext* function(asIScriptEngine*, void*);
alias asRETURNCONTEXTFUNC_t = void function(asIScriptEngine*, asIScriptContext*, void*);