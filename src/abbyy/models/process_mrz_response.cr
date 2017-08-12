require "./task_response"

module Abbyy::Models
  # Response object for [/processMRZ](http://ocrsdk.com/documentation/apireference/processMRZ/) API-method.
  #
  # ###Output file format
  #
  # The output XML file has the following format:
  # ```
  # <?xml version="1.0" encoding="utf-8"?>
  # <document type="mrz" xmlns="http://ocrsdk.com/schema/captureData-1.0.xsd">
  #   <field type="LastName">
  #     <value>MALBORSKYI</value>
  #   </field>
  #   <field type="DocumentNumber">
  #     <value>755327941</value>
  #   </field>
  #    ...
  #
  # </document>
  # ```
  #
  # If the output file contains empty <document/> tag no MRZ was found on the recognized image.
  #
  # See the [XSD schema](http://ocrsdk.com/schema/captureData-1.0.xsd) of an output file.
  #
  # ###Possible field types of the machine-readable zone
  # - **MrzType** The number of lines in MRZ. It can have one of the following values:
  #   - *2line*
  #   - *3line*
  # The example of a 2-line MRZ:
  # ```text
  # P<RUSMALBORSKYI<<KOVBOJ<<<<<<<<<<<<<<<<<<<<<
  # 7553279419RUS8712242M2104131<<<<<<<<<<<<<<02
  # ```
  # - **Line1** All characters of the first line of machine readable zone.
  # Example: `P<RUSMALBORSKYI<<KOVBOJ<<<<<<<<<<<<<<<<<<<<<`
  # - **Line2** All characters of the second line of machine readable zone.
  # Example: `7553279419RUS8712242M2104131<<<<<<<<<<<<<<02`
  # - **Line3** All characters of the third line of machine readable zone (if exists).
  # - **DocumentType** The type of a document. It is the first character of the first line.
  # Example: P, which indicates a passport.
  # - **DocumentSubtype** The subtype of a document (if exists). It is the second character of the first line.
  # - **IssuingCountry** Code of issuing state (ISO 3166-1 alpha-3 code).
  # Example: RUS
  # - **LastName** Surname.
  # Example: MALBORSKYI
  # - **GivenName** One or several given names separated with the space character.
  # Example: KOVBOJ
  # - **DocumentNumber** The number of a document.
  # Example: 755327941
  # - **DocumentNumberVerified** The Boolean value that specifies whether the
  # checksum over the document number matches the check digit. It can have one of the following values:
  #   - **true**
  #   - **false**
  # - **DocumentNumberCheck** The check digit over the document number.
  # Example: 9
  # - **Nationality** Nationality (ISO 3166-1 alpha-3 code).
  # Example: RUS
  # - **BirthDate** Date of birth in the format: YYMMDD.
  # Example: 871224
  # - **BirthDateVerified** The Boolean value that specifies whether the
  # checksum over the birth date matches the check digit. It can have one of the following values:
  #   - **true**
  #   - **false**
  # - **BirthDateCheck** The check digit over the birth date.
  # Example: 2
  # - **Sex** Sex. It can have one of the following values:
  #   - *M*
  #   - *F*
  #   - *<*
  # - **ExpiryDate** Date of expiry in the format: YYMMDD.
  # Example: 210413
  # - **ExpiryDateVerified** The Boolean value that specifies whether the
  # checksum over the expiry date matches the check digit. It can have one of the following values:
  #   - **true**
  #   - **false**
  # - **ExpiryDateCheck** The check digit over the expiry date.
  # Example: 1
  # - **PersonalNumber** Personal number. Personal number and its check digit are optional in MRZ.
  # - **PersonalNumberVerified** The Boolean value that specifies whether the
  # checksum over the personal number matches the check digit. It can have one of the following values:
  #   - **true**
  #   - **false**
  # - **PersonalNumberCheck** The check digit over the personal number.
  # Personal number and its check digit are optional in MRZ.
  # - **OptionalDataLine1** Optional data from the first line of the 3-line MRZ.
  # - **OptionalDataLine2** Optional data from the second line of the 3-line MRZ.
  # - **Checksum** The check digit over the document number, birth date,
  # expiry date, personal number, optional data, and their check digits.
  # Example: 2
  # - **ChecksumVerified** The Boolean value that specifies whether the
  # checksum over the document number, birth date, expiry date, personal number,
  # optional data, and their check digits matches the check digit.
  # You can check the quality of data extraction by the value of this field.
  # However note that there is no check digit over the surname and given names.
  # Therefore these fields may contain recognition errors even if the checksum
  # over all other fields matches the check digit.
  # It can have one of the following values:
  #   - **true**
  #   - **false**
  #
  # For more information on MRZ standard see [Wikipedia](http://en.wikipedia.org/wiki/Mrz).
  class ProcessMRZResponse < TaskResponse
  end
end
