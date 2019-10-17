**makefile文件普通版本**

```makefile
.SUFFIXES: .idl .cpp .o


PROGRAM = test

OBJECTS = test.o


OBJ_EXT =


CC	= `makeopts.sh cc`
CCFLAGS = `makeopts.sh ccflag $(DATABASE)_inc pi_inc`
LDFLAGS = `makeopts.sh ldflag`
LIBS	= `makeopts.sh syslib pub odb_api pi_app_lib` -lisca_common -lm -lrte -lman -lalarmclient -lsam_service -lparamanage -lmstream -ltcpcomm -lmgettext
#LIBS	= `makeopts.sh syslib pub odb_api pi_app_lib` -ldb_commit_client -lsca_common -lm -lrte -lcomm
# Valid LIBS args: syslib odb_api sam para msg marshal_lib corba_lib odb_net socket $(DATABASE)_lib`

BIN_PATH = `makeopts.sh bin_path`

.idl.cpp:
	@echo	$(IDL_CC) $<
	@	$(IDL_CC) $<


.cpp.o:
	@echo	$(CC) $(CCFLAGS) $<
	@	$(CC) $(CCFLAGS) $<

$(PROGRAM): $(OBJECTS) $(OBJ_EXT)
	@echo	$(CC) -o $(PROGRAM)  $(OBJECTS) $(OBJ_EXT) $(LDFLAGS) $(LIBS) 
	@	$(CC) -o $(PROGRAM)  $(OBJECTS) $(OBJ_EXT) $(LDFLAGS) $(LIBS) 
	@echo	cp -pf $(PROGRAM) $(BIN_PATH)
	@	cp -pf $(PROGRAM) $(BIN_PATH)


# optional part

RM 	= rm -f

clean:
	$(RM) $(PROGRAM) $(OBJECTS)

cleano:
	$(RM) $(OBJECTS)

cleanp:
	$(RM) $(PROGRAM)



```