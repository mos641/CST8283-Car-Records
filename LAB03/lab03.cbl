      ******************************************************************
      * Author: Mostapha A
      * Purpose: Read car records from an external file
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.

       PROGRAM-ID. LAB03.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT CAR-FILE-IN
               ASSIGN TO "..\CARFILE.TXT"
                   ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.
       FD CAR-FILE-IN.
       01 CAR-RECORD-IN.
           05 CAR-MODEL PIC X(15).
           05 CAR-DATA.
               10 ENGINE PIC X(25).
               10 TOWING-CAPACITY PIC X(9).
               10 OWNER-NAME PIC X(30).

       WORKING-STORAGE SECTION.

       01 CONTROL-FIELDS.
           05 EOF-FLG PIC 9 VALUE 0.

       PROCEDURE DIVISION.

       100-PRODUCE-CAR-LIST.
           PERFORM 201-INITIATE-CAR-LIST.
           PERFORM 202-DISPLAY-ONE-CAR-RECORD
                UNTIL EOF-FLG EQUAL 1.
      *          2 TIMES.
           PERFORM 203-CLOSE-CAR-FILE.
           STOP RUN.

       201-INITIATE-CAR-LIST.
           PERFORM 301-OPEN-CAR-FILE.
           PERFORM 303-READ-CAR-RECORD.

       202-DISPLAY-ONE-CAR-RECORD.
           PERFORM 302-DISPLAY-CAR-MODEL.
           PERFORM 303-READ-CAR-RECORD.

       203-CLOSE-CAR-FILE.
           CLOSE CAR-FILE-IN.

       301-OPEN-CAR-FILE.
           OPEN INPUT CAR-FILE-IN.

       302-DISPLAY-CAR-MODEL.
           DISPLAY CAR-MODEL.

       303-READ-CAR-RECORD.
           READ CAR-FILE-IN
               AT END MOVE 1 TO EOF-FLG.

       END PROGRAM LAB03.
