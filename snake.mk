##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=snake
ConfigurationName      :=Debug
WorkspacePath          :=/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb
ProjectPath            :=/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Alfred Björk
Date                   :=12/12/2016
CodeLitePath           :="/Users/Alfred/Library/Application Support/codelite"
LinkerName             :=/Applications/gcc-arm/bin/arm-none-eabi-g++
SharedObjectLinkerName :=/Applications/gcc-arm/bin/arm-none-eabi-g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="snake.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -nostartfiles -T$(ProjectPath)/md407-ram.x
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/armv6-m $(LibraryPathSwitch)$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/5.4.1/armv6-m 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /Applications/gcc-arm/bin/arm-none-eabi-ar rcu
CXX      := /Applications/gcc-arm/bin/arm-none-eabi-g++
CC       := /Applications/gcc-arm/bin/arm-none-eabi-gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -std=c99 -mthumb -march=armv6-m -msoft-float -Wa,-adhln=test.s $(Preprocessors)
ASFLAGS  := 
AS       := /Applications/gcc-arm/bin/arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
Objects0=$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/display.c$(ObjectSuffix) $(IntermediateDirectory)/delay.c$(ObjectSuffix) $(IntermediateDirectory)/logic.c$(ObjectSuffix) $(IntermediateDirectory)/keypad.c$(ObjectSuffix) $(IntermediateDirectory)/random.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	arm-none-eabi-objcopy -S -O srec  ./Debug/snake.elf ./Debug/snake.s19
	@echo Done

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/startup.c$(ObjectSuffix): startup.c $(IntermediateDirectory)/startup.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix)startup.c

$(IntermediateDirectory)/display.c$(ObjectSuffix): display.c $(IntermediateDirectory)/display.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/display.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/display.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/display.c$(DependSuffix): display.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/display.c$(ObjectSuffix) -MF$(IntermediateDirectory)/display.c$(DependSuffix) -MM display.c

$(IntermediateDirectory)/display.c$(PreprocessSuffix): display.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/display.c$(PreprocessSuffix)display.c

$(IntermediateDirectory)/delay.c$(ObjectSuffix): delay.c $(IntermediateDirectory)/delay.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/delay.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/delay.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/delay.c$(DependSuffix): delay.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/delay.c$(ObjectSuffix) -MF$(IntermediateDirectory)/delay.c$(DependSuffix) -MM delay.c

$(IntermediateDirectory)/delay.c$(PreprocessSuffix): delay.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/delay.c$(PreprocessSuffix)delay.c

$(IntermediateDirectory)/logic.c$(ObjectSuffix): logic.c $(IntermediateDirectory)/logic.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/logic.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/logic.c$(DependSuffix): logic.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/logic.c$(ObjectSuffix) -MF$(IntermediateDirectory)/logic.c$(DependSuffix) -MM logic.c

$(IntermediateDirectory)/logic.c$(PreprocessSuffix): logic.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/logic.c$(PreprocessSuffix)logic.c

$(IntermediateDirectory)/keypad.c$(ObjectSuffix): keypad.c $(IntermediateDirectory)/keypad.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/keypad.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/keypad.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/keypad.c$(DependSuffix): keypad.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/keypad.c$(ObjectSuffix) -MF$(IntermediateDirectory)/keypad.c$(DependSuffix) -MM keypad.c

$(IntermediateDirectory)/keypad.c$(PreprocessSuffix): keypad.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/keypad.c$(PreprocessSuffix)keypad.c

$(IntermediateDirectory)/random.c$(ObjectSuffix): random.c $(IntermediateDirectory)/random.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/random.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/random.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/random.c$(DependSuffix): random.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/random.c$(ObjectSuffix) -MF$(IntermediateDirectory)/random.c$(DependSuffix) -MM random.c

$(IntermediateDirectory)/random.c$(PreprocessSuffix): random.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/random.c$(PreprocessSuffix)random.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


