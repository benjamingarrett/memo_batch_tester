#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}
ARORADIR=../a100
ARORAOBJDIR=${ARORADIR}/${OBJECTDIR}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/c56916c5/MurmurHash32.o \
	${OBJECTDIR}/_ext/c56916c5/MurmurHash64A.o \
	${OBJECTDIR}/_ext/554cfc1b/memo.o \
	${OBJECTDIR}/_ext/554cfc1b/memo_long_int.o \
	${OBJECTDIR}/_ext/f34e89a/operation_sequence_reader.o \
  ${OBJECTDIR}/_ext/f34e89b/lcss.o \
  ${OBJECTDIR}/_ext/f34e89c/edit_distance.o \
  ${OBJECTDIR}/_ext/f34e89d/kmp.o \
  ${OBJECTDIR}/_ext/f34e89e/fibonacci.o \
  ${OBJECTDIR}/_ext/f34e89f/lcs_instance_reader.o \
	${OBJECTDIR}/_ext/f34e89g/permutations.o \
  ${OBJECTDIR}/_ext/f34e89h/sequence_alignment.o \
  ${ARORAOBJDIR}/estimate.o \
  ${ARORAOBJDIR}/initialize.o \
  ${ARORAOBJDIR}/initialize_options.o \
  ${ARORAOBJDIR}/initialize_schema_tables.o \
  ${ARORAOBJDIR}/memo_tables.o \
  ${ARORAOBJDIR}/partition.o \
  ${ARORAOBJDIR}/perturb.o \
  ${ARORAOBJDIR}/portalize.o \
  ${ARORAOBJDIR}/report.o \
  ${ARORAOBJDIR}/schema_table_landscape.o \
  ${ARORAOBJDIR}/schema_table_landscape_MAX_FOUR_SEGMENTS.o \
  ${ARORAOBJDIR}/schema_table_landscape_MAX_THREE_SEGMENTS.o \
  ${ARORAOBJDIR}/schema_table_landscape_MAX_TWO_SEGMENTS.o \
  ${ARORAOBJDIR}/schema_table_portrait.o \
  ${ARORAOBJDIR}/schema_table_portrait_MAX_FOUR_SEGMENTS.o \
  ${ARORAOBJDIR}/schema_table_portrait_MAX_THREE_SEGMENTS.o \
  ${ARORAOBJDIR}/schema_table_portrait_MAX_TWO_SEGMENTS.o \
  ${ARORAOBJDIR}/solve_arora.o \
  ${ARORAOBJDIR}/solve_tsp.o \
  ${ARORAOBJDIR}/utilities.o \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/memo_batch_test.o


# C Compiler Flags
CFLAGS=-g 

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-lm

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/memo_batch_tester 

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/memo_batch_tester: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/memo_batch_tester ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/_ext/c56916c5/MurmurHash32.o: ../hashing/MurmurHash32.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/c56916c5
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/c56916c5/MurmurHash32.o ../hashing/MurmurHash32.c

${OBJECTDIR}/_ext/c56916c5/MurmurHash64A.o: ../hashing/MurmurHash64A.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/c56916c5
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/c56916c5/MurmurHash64A.o ../hashing/MurmurHash64A.c

${OBJECTDIR}/_ext/554cfc1b/memo.o: ../memoization/memo.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/554cfc1b
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/554cfc1b/memo.o ../memoization/memo.c

${OBJECTDIR}/_ext/554cfc1b/memo_long_int.o: ../memoization/memo_long_int.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/554cfc1b
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/554cfc1b/memo_long_int.o ../memoization/memo_long_int.c

${OBJECTDIR}/_ext/f34e89a/operation_sequence_reader.o: ../operation_sequence_reader/operation_sequence_reader.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f34e89a
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f34e89a/operation_sequence_reader.o ../operation_sequence_reader/operation_sequence_reader.c

${OBJECTDIR}/_ext/f34e89b/lcss.o: ../lcss100/lcss.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f34e89b
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f34e89b/lcss.o ../lcss100/lcss.c

${OBJECTDIR}/_ext/f34e89c/edit_distance.o: ../edit_distance100/edit_distance.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f34e89c
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f34e89c/edit_distance.o ../edit_distance100/edit_distance.c

${OBJECTDIR}/_ext/f34e89d/kmp.o: ../kmp100/kmp.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f34e89d
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f34e89d/kmp.o ../kmp100/kmp.c

${OBJECTDIR}/_ext/f34e89e/fibonacci.o: ../fibonacci100/fibonacci.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f34e89e
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f34e89e/fibonacci.o ../fibonacci100/fibonacci.c

${OBJECTDIR}/_ext/f34e89f/lcs_instance_reader.o: ../lcs_instance_reader/lcs_instance_reader.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f34e89f
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f34e89f/lcs_instance_reader.o ../lcs_instance_reader/lcs_instance_reader.c

${OBJECTDIR}/_ext/f34e89g/permutations.o: ../permutations100/permutations.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f34e89g
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f34e89g/permutations.o ../permutations100/permutations.c

${OBJECTDIR}/_ext/f34e89h/sequence_alignment.o: ../sequence_alignment100/sequence_alignment.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/f34e89h
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f34e89h/sequence_alignment.o ../sequence_alignment100/sequence_alignment.c

${OBJECTDIR}/main.o: main.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.c

${OBJECTDIR}/memo_batch_test.o: memo_batch_test.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -std=c11 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/memo_batch_test.o memo_batch_test.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/memo_batch_tester

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
