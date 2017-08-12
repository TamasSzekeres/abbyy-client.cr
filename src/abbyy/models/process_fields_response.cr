require "./task_response"

module Abbyy::Models
  # Response object for [/processFields](http://ocrsdk.com/documentation/apireference/processFields/) API-method.
  #
  # ###Status codes
  #
  # The following status codes can be returned when this method is called:
  # - **200** Successful method call.
  # - **450** Incorrect parameters have been passed. One of the following errors occurred:
  #   - The identifier of the task has not been specified.
  #   - Incorrect XML file has been transmitted.
  #   - The task with the specified identifier cannot be started (e.g. it has already been started).
  #   - Task description length exceeds 255 characters.
  #   - Exceeded quota to add images. This error is returned if the number of
  # images you have uploaded exceeds the number of images you can process with
  # the credits available on your account plus some threshold. You can resolve
  # this issue by topping up your account or by removing the tasks which have
  # been submitted but have not been processed.
  # - **550** An internal program error occurred while processing the image.
  #
  # ###Output file format
  #
  # The output XML file has the following format:
  #
  # ```
  # <?xml version="1.0" encoding="utf-8" standalone="yes"?>
  # <document xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://ocrsdk.com/schema/resultDescription-1.0.xsd http://ocrsdk.com/schema/resultDescription-1.0.xsd" xmlns="http://ocrsdk.com/schema/resultDescription-1.0.xsd">
  #   <page index="0">
  #     <text id="print" left="160" top="349" right="339" bottom="384">
  #       <value>Vertraqsnummer:</value>
  #       <line left="167" top="366" right="326" bottom="384">
  #         <char left="167" top="366" right="180" bottom="382">V</char>
  #         <char left="182" top="370" right="192" bottom="382">e</char>
  #         <char left="194" top="370" right="199" bottom="382">r</char>
  #         <char left="199" top="367" right="205" bottom="382">t</char>
  #         <char left="206" top="370" right="212" bottom="382">r</char>
  #         <char left="213" top="370" right="223" bottom="382">a</char>
  #         <char left="224" top="370" right="234" bottom="384">q</char>
  #         <char left="236" top="371" right="245" bottom="383">s</char>
  #         <char left="247" top="371" right="256" bottom="382">n</char>
  #         <char left="258" top="371" right="268" bottom="383">u</char>
  #         <char left="270" top="370" right="285" bottom="383">m</char>
  #         <char left="287" top="370" right="302" bottom="382">
  #           <charRecVariants>
  #             <variant charConfidence="22">m</variant>
  #             <variant charConfidence="-1">rn</variant>
  #           </charRecVariants>m</char>
  #         <char left="304" top="370" right="314" bottom="382">e</char>
  #         <char left="316" top="370" right="322" bottom="382">r</char>
  #         <char left="324" top="370" right="326" bottom="382" suspicious="true">:</char>
  #       </line>
  #     </text>
  #     <text id="handprint" left="387" top="1035" right="635" bottom="1089">
  #       <value>309.05</value>
  #       <line left="398" top="1045" right="633" bottom="1089">
  #         <char left="398" top="1052" right="426" bottom="1088">3</char>
  #         <char left="423" top="1061" right="455" bottom="1089" suspicious="true">0</char>
  #         <char left="482" top="1055" right="505" bottom="1089">9</char>
  #         <char left="507" top="1084" right="512" bottom="1087">.</char>
  #         <char left="520" top="1058" right="549" bottom="1089">0</char>
  #         <char left="546" top="1045" right="633" bottom="1089" suspicious="true">5</char>
  #       </line>
  #     </text>
  #     <checkmark id="checked" left="883" top="427" right="928" bottom="469">
  #       <value>checked</value>
  #     </checkmark>
  #     <checkmark id="not checked" left="884" top="511" right="928" bottom="554">
  #       <value>unchecked</value>
  #     </checkmark>
  #     <barcode id="leftBarcode" left="46" top="1048" right="128" bottom="1350">
  #       <value encoding="Base64">QkYxMDExNQ==</value>
  #     </barcode>
  #   </page>
  # </document>
  # ```
  #
  # See the [XSD schema](http://ocrsdk.com/schema/resultDescription-1.0.xsd) of the output file.
  class ProcessFieldsResponse < TaskResponse
  end
end
