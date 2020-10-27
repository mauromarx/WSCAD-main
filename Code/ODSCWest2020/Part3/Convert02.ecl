﻿IMPORT $;
IMPORT ML_Core;

// Reference your training and test datasets
myTrainData := $.Prep01.myTrainData;
myTestData  := $.Prep01.myTestData;

// Convert your datasets to matrix format
ML_Core.ToField(myTrainData, myTrainDataNF);
ML_Core.ToField(myTestData, myTestDataNF);
// myTrainDataNF;
// myTestDataNF;

// Label the field containing the dependent variable to '1' (optional)
EXPORT Convert02 := MODULE
		
		EXPORT myIndTrainDataNF := myTrainDataNF(number < 10); // Number is the field number
		EXPORT myDepTrainDataNF := PROJECT(myTrainDataNF(number = 10), 
																			 TRANSFORM(RECORDOF(LEFT), 
																								 SELF.number := 1,
																								 SELF := LEFT));
		EXPORT myIndTestDataNF := myTestDataNF(number < 10); // Number is the field number
		EXPORT myDepTestDataNF := PROJECT(myTestDataNF(number = 10), 
																			TRANSFORM(RECORDOF(LEFT), 
																								SELF.number := 1,
																								SELF := LEFT));
																									
END;
