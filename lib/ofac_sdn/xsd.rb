# frozen_string_literal: true

module OfacSdn
  # https://www.treasury.gov/resource-center/sanctions/SDN-List/Documents/sdn.xsd
  XSD_HASH =
    {
      sdnEntry: {
        element: {
          uid: 'int',
          firstName: 'string',
          lastName: 'string',
          title: 'string',
          sdnType: 'string',
          remarks: 'string'
        }
      },
      programList: {
        element: {
          program: 'string'
        }
      },
      idList: {
        key: 'id',
        element: {
          uid: 'int',
          idType: 'string',
          idNumber: 'string',
          idCountry: 'string',
          issueDate: 'string',
          expirationDate: 'string'
        }
      },
      akaList: {
        key: 'aka',
        element: {
          uid: 'int',
          type: 'string',
          category: 'string',
          lastName: 'string',
          firstName: 'string'
        }
      },
      addressList: {
        key: 'address',
        element:
        {
          uid: 'int',
          address1: 'string',
          address2: 'string',
          address3: 'string',
          city: 'string',
          stateOrProvince: 'string',
          postalCode: 'string',
          country: 'string'
        }
      },
      nationalityList: {
        key: 'nationality',
        element: {
          uid: 'int',
          country: 'string',
          mainEntry: 'bool'
        }
      },
      citizenshipList: {
        key: 'citizenship',
        element: {
          uid: 'int',
          country: 'string',
          mainEntry: 'bool'
        }
      },
      dateOfBirthList: {
        key: 'dateOfBirthItem',
        element: {
          uid: 'int',
          dateOfBirth: 'string',
          mainEntry: 'bool'
        }
      },
      placeOfBirthList: {
        key: 'placeOfBirthItem',
        element: {
          uid: 'int',
          placeOfBirth: 'string',
          mainEntry: 'bool'
        }
      },
      vesselInfo: {
        element: {
          callSign: 'string',
          vesselType: 'string',
          vesselFlag: 'string',
          vesselOwner: 'string',
          tonnage: 'int',
          grossRegisteredTonnage: 'int'
        }
      }
    }.freeze
end
