require "./task_response"

module Abbyy::Models
  # Response object for [/processBusinessCard](http://ocrsdk.com/documentation/apireference/processBusinessCard/) API-method.
  #
  # ###Status codes
  #
  # The following status codes can be returned when this method is called:
  # - **200** Successful method call.
  # - **450** Incorrect parameters have been passed. One of the following errors occurred:
  #   - Image file has not been specified.
  #   - Incorrect recognition language has been specified.
  #   - Incorrect export format has been specified.
  #   - Task description length exceeds 255 characters.
  #   - Incorrect password for accessing password-protected image file has been specified.
  #   - Exceeded quota to add images. This error is returned if the number of
  # images you have uploaded exceeds the number of images you can process with
  # the credits available on your account plus some threshold. You can resolve
  # this issue by topping up your account or by removing the tasks which have
  # been submitted but have not been processed.
  # - **550** An internal program error occurred while processing the image.
  # - **551** An error occurred on the server side:
  #   - The format of the image file passed for processing is not supported.
  #   - The PDF file passed for processing has restrictions on creating raster images.
  #
  # ###Output XML file format
  # If the `ProcessDocumentRequest::export_format` parameter is set to xml, the result of processing is
  # returned in an XML file of the following format:

  # ```xml
  # <?xml version="1.0" encoding="utf-8" standalone="yes"?>
  # <document xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://ocrsdk.com/schema/recognizedBusinessCard-1.0.xsd http://ocrsdk.com/schema/recognizedBusinessCard-1.0.xsd" xmlns="http://ocrsdk.com/schema/recognizedBusinessCard-1.0.xsd">
  #   <businessCard imageRotation="noRotation">
  #     <field type="Phone">
  #       <value>783-37-00</value>
  #     </field>
  #     <field type="Fax">
  #       <value>783-26-63</value>
  #     </field>
  #     <field type="Email">
  #       <value>john_sm@abbyy.com</value>
  #     </field>
  #     <field type="Web">
  #       <value>www.abbyy.com</value>
  #     </field>
  #     <field type="Address">
  #       <value>Otradnaya str., 2b, bld.6, 127273, Moscow, Russia</value>
  #     </field>
  #     <field type="Name">
  #       <value>John Smith</value>
  #     </field>
  #     <field type="Company">
  #       <value>ABBYY Headquarters</value>
  #     </field>
  #     <field type="Job">
  #       <value>Product Analyst</value>
  #     </field>
  #     <field type="Text">
  #       <value>ABBYY ABBYY Headquarters John Smith Product Analyst ABBYY Headquarters Otradnaya str., 2b, bld.6, 127273, Moscow, Russia Tel: 783-37-00 Fax: 783-26-63 john_sm@abbyy.com www.abbyy.com </value>
  #     </field>
  #   </businessCard>
  # </document>
  # ```
  #
  # **Note**: The **imageRotation** attribute is supported only for the output xml
  # format. This attribute specifies rotation that was performed upon the input image, namely:
  # - *noRotation* - this value denotes no rotation
  # - *clockwise* - rotation 90 degrees clockwise
  # - *counterclockwise* - rotation 90 degrees counterclockwise (270 degrees clockwise)
  # - *upsideDown* - rotation upside down (180 degrees).
  #
  # See the [XSD schema](http://ocrsdk.com/schema/recognizedBusinessCard-1.0.xsd) of an XML file.
  #
  # ###Description of business card fields
  #
  # Below you can see the list of the fields which can be recognized on a
  # business card. Some of the fields can also contain field components
  # (such as zip code and city for the address).
  # - **Name** - The person's name. - **Possible components:** (FirstName, LastName, MiddleName, ExtraName)
  # - **Phone** - The phone number. - **Possible components:** (PhonePrefix, PhoneCountryCode, PhoneCode, PhoneBody, PhoneExtension)
  # - **Mobile** - The mobile phone number. - **Possible components:** (PhonePrefix, PhoneCountryCode, PhoneCode, PhoneBody, PhoneExtension)
  # - **Fax** - The fax number. - **Possible components:** (PhonePrefix, PhoneCountryCode, PhoneCode, PhoneBody, PhoneExtension)
  # - **Company** - The company's name.
  # - **Job** - The person's position in the company. - **Possible components:** (JobPosition, JobDepartment)
  # - **Address** - This can be the company's address or the personal address. - **Possible components:** (ZipCode, Country, City, StreetAddress)
  # - **Email** - The e-mail address.
  # - **Web** - The company's or personal website.
  # - **Text** - This field contains all the text recognized on the business card.
  class ProcessBusinessCardResponse < TaskResponse
  end
end
