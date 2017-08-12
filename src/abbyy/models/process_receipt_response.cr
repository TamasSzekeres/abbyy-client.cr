require "./task_response"

module Abbyy::Models
  # Response object for [/processReceipt](http://ocrsdk.com/documentation/apireference/processReceipt/) API-method.
  #
  # ###Output file format
  #
  # The result of processing is returned in an XML file of the following format:
  # ```
  # <?xml version="1.0" encoding="UTF-8"?>
  # <receipts count="1" xmlns="http://www.abbyy.com/ReceiptCaptureSDK_xml/ReceiptCapture-1.0.xsd">
  #  <receipt currency="USD">
  #   <vendor confidence="73.71695592" isSuspicious="false">
  #    <name>
  #     <classifiedValue>PetSmart</classifiedValue>
  #     <recognizedValue>
  #      <text>PETSMART</text>
  #     </recognizedValue>
  #    </name>
  #    <address>
  #     <text><![CDATA[175 RANCH DR]]></text>
  #    </address>
  #    <phone confidence="100" isSuspicious="false">
  #     <normalizedValue>4089561044</normalizedValue>
  #     <recognizedValue>
  #      <text>408-956-1044</text>
  #     </recognizedValue>
  #    </phone>
  #    <purchaseType>General Retail</purchaseType>
  #    <city confidence="20" isSuspicious="true">
  #     <normalizedValue>MILPITAS</normalizedValue>
  #     <recognizedValue>
  #      <text>MILPITAS</text>
  #     </recognizedValue>
  #    </city>
  #    <zip confidence="63" isSuspicious="true">
  #     <normalizedValue>95035</normalizedValue>
  #     <recognizedValue>
  #      <text>CA 95035</text>
  #     </recognizedValue>
  #    </zip>
  #    <administrativeRegion confidence="100" isSuspicious="false">
  #     <normalizedValue>CA</normalizedValue>
  #     <recognizedValue>
  #      <text>CA</text>
  #     </recognizedValue>
  #    </administrativeRegion>
  #   </vendor>
  #   <subTotal>
  #    <normalizedValue>22.92</normalizedValue>
  #    <recognizedValue>
  #     <text>22.92</text>
  #    </recognizedValue>
  #   </subTotal>
  #   <total confidence="67" isSuspicious="true">
  #    <normalizedValue>24.93</normalizedValue>
  #    <recognizedValue>
  #     <text>PA 93</text>
  #    </recognizedValue>
  #   </total>
  #   <tax total="false" rate="8.75">
  #    <normalizedValue>2.01</normalizedValue>
  #    <recognizedValue>
  #     <text>8.750% 2 01</text>
  #    </recognizedValue>
  #   </tax>
  #   <payment type="Undefined" confidence="0" isSuspicious="true">
  #    <value>
  #     <normalizedValue>24.93</normalizedValue>
  #     <recognizedValue>
  #      <text>PA 93</text>
  #     </recognizedValue>
  #    </value>
  #   </payment>
  #   <recognizedItems count="3">
  #    <item index="1">
  #     <name confidence="0" isSuspicious="true">
  #      <text>TOY BRD 4LB</text>
  #     </name>
  #     <total confidence="43" isSuspicious="true">
  #      <normalizedValue>11.89</normalizedValue>
  #      <recognizedValue>
  #       <text>11.89</text>
  #      </recognizedValue>
  #     </total>
  #     <recognizedText><![CDATA[0073052151457 TOY BRD 4LB 11.89
  # REG PRICE 13.99
  # F&F Savings 2.10-
  # (RETURN PRICE 11.89 EA)]]></recognizedText>
  #     <sku confidence="51" isSuspicious="true">
  #      <normalizedValue>0073052151457</normalizedValue>
  #      <recognizedValue>
  #       <text>0073052151457</text>
  #      </recognizedValue>
  #     </sku>
  #     <amountUnits confidence="0" isSuspicious="true">Unknown</amountUnits>
  #    </item>
  #   ...
  #   </recognizedItems>
  #   <recognizedText><![CDATA[
  #   ...
  # ]]></recognizedText>
  #  </receipt>
  # </receipts>
  # ```
  # See the [XSD schema](http://www.abbyy.com/ReceiptCaptureSDK_xml/ReceiptCapture-1.0.xsd?__hstc=92301634.4c1b0fb86f86ef86e649e94bf78ce47f.1497682592548.1502554564404.1502559834842.29&__hssc=92301634.12.1502559834842&__hsfp=3407439041&_ga=2.149725046.1314961773.1502350625-1586329993.1497682592) of an XML file.
  #
  # ###Receipt languages
  #
  # You do not need to set the recognition languages for receipt recognition;
  # they will be selected automatically on the basis of the countries you specify.
  # See below the list of languages corresponding to countries.
  # - **United Kingdom** - English
  # - **USA** - English
  # - **Japan** - Japanese; English
  # - **Germany** - German
  # - **Italy** - Italian; English
  # - **France** - French
  # - **Brazil** - Portuguese (Brazil); English
  # - **Russia** - Russian
  # - **China** - Chinese Simplified
  # - **Korea** - Korean; English
  # - **Spain** - Spanish; English
  # - **Taiwan** - Chinese Traditional
  # - **Netherlands** - Dutch
  # - **Australia** - English
  # - **Canada** - English; French
  # - **Singapore** - Malay; Chinese Simplified; English
  # - **Turkey** - Turkish
  #
  # Note that the receipt in one of these languages, but printed in some other
  # country, is not guaranteed to be recognized correctly.
  class ProcessReceiptResponse < TaskResponse
  end
end
