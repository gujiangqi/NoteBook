**需要qt类的makefile文件**
```makefile
.SUFFIXES: .cpp .o

PROGRAM1 = test


OBJECTS1 =  test.o \
		
OBJ_EXT =

CC	= `makeopts.sh cc`
CCFLAGS = `makeopts.sh ccflag` -I$(QTDIR)/include -I$(QTDIR)/include/QtCore
LDFLAGS = `makeopts.sh ldflag` -L$(QTDIR)/lib

LIBS1	= `makeopts.sh syslib sam pub odb_api log para ` -ldbclient -lm -lmidhc -lmsgproxy -lsqlspclient -lQtCore -lrte -lman -lsca_common -lalarmclient -lsampledataclient

RM 	= rm -f
CP	= cp -f

.cpp.o:
	@echo	$(CC) $(CCFLAGS) $<
	@	$(CC) $(CCFLAGS) $<

$(PROGRAM1): $(OBJECTS1) $(OBJ_EXT) $(LOCAL_LIBRARIES)
	@echo	$(CC) -o $(PROGRAM1)  $(OBJECTS1) $(OBJ_EXT) $(LDFLAGS) $(LIBS1)
	@	$(CC) -o $(PROGRAM1)  $(OBJECTS1) $(OBJ_EXT) $(LDFLAGS) $(LIBS1)
	cp $(PROGRAM1) $(D5000_HOME)/bin

clean:
	$(RM) $(PROGRAM1) $(OBJECTS1)
	

cleano:
	$(RM) $(OBJECTS1)


cleanp:
	$(RM) $(PROGRAM1)
	

	

```