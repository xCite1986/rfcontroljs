module.exports = (helper) ->
  # mapping for decoding
  pulsesToBinaryMapping = {
    '0101': '1' #binary 1
    '1010': '1' #binary 1
    '0110': '0' #binary 0
    '02': ''    #footer
  }
  # same for send
  binaryToPulse = {
    '1': '1010'
    '0': '0110'
  }
  return protocolInfo = {
    name: 'pir6'
    type: 'pir'
    values:
      id:
        type: "binary"
      presence:
        type: "boolean"
      unit:
        type: "number"
    brands: ["Importe-Uzman"]
    pulseLengths: [150, 453, 4733]
    pulseCounts: 50
    decodePulses: (pulses) ->

      binary = helper.map(pulses, pulsesToBinaryMapping)

      return result = {
        id: helper.binaryToNumber(binary, 0, 4)
        unit: helper.binaryToNumber(binary, 5, 9)
        presence: true
      }
  }
