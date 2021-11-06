//
//  ProductSearchResultTests.swift
//  ProductListTests
//
//  Created by Test on 6/11/21.
//

import XCTest
@testable import ProductList

class ProductSearchResultTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_EmptyResult_Min() throws {
        let result = try? ProductSearchResult.fromJSONString(ProductSearchResultTestsData.product_empty_list_min_json)
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(result.query, ProductSearchResultTestsData.query_string)
            XCTAssertEqual(result.products.count, 0)
        }
    }

    func test_OneItemResult_Min() throws {
        let result = try? ProductSearchResult.fromJSONString(ProductSearchResultTestsData.product_one_item_list_min_json)
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(result.query, ProductSearchResultTestsData.query_string)
            XCTAssertEqual(result.products.count, 1)
        }
    }

    func test_OneItemResult_Full() throws {
        let result = try? ProductSearchResult.fromJSONString(ProductSearchResultTestsData.product_one_item_list_min_json)
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(result.query, ProductSearchResultTestsData.query_string)
            XCTAssertEqual(result.products.count, 1)
        }
    }
    
    func test_MissingFields() throws {
        XCTAssertThrowsError(try ProductSearchResult.fromJSONString(ProductSearchResultTestsData.product_missing_fields_json), "fromJSONString should throw for an invalid JSON") { error in
            print(error)
        }
    }

}

struct ProductSearchResultTestsData {
    static let query_string = "Motorola G6"
    
    static let product_empty_list_min_json = """
{
    "site_id": "MLU",
    "country_default_time_zone": "GMT-03:00",
    "query": "\(query_string)",
    "results": []
}
"""

    static let product_one_item_list_min_json = """
{
    "site_id": "MLU",
    "country_default_time_zone": "GMT-03:00",
    "query": "\(query_string)",
    "results": [
        \(ProductInfoTestsData.product_json_full)
    ]
}
"""

    static let product_missing_fields_json = """
{
    "site_id": "MLU",
    "country_default_time_zone": "GMT-03:00",
    "query": "\(query_string)"
}
"""

    static let product_one_item_list_json = """
{
    "site_id": "MLU",
    "country_default_time_zone": "GMT-03:00",
    "query": "\(query_string)",
    "paging": {
        "total": 6,
        "primary_results": 3,
        "offset": 0,
        "limit": 50
    },
    "results": [
        \(ProductInfoTestsData.product_json_full)
    ],
    "sort": {
        "id": "relevance",
        "name": "Más relevantes"
    },
    "available_sorts": [
        {
            "id": "price_asc",
            "name": "Menor precio"
        },
        {
            "id": "price_desc",
            "name": "Mayor precio"
        }
    ],
    "filters": [
        {
            "id": "category",
            "name": "Categorías",
            "type": "text",
            "values": [
                {
                    "id": "MLU1055",
                    "name": "Celulares y Smartphones",
                    "path_from_root": [
                        {
                            "id": "MLU1051",
                            "name": "Celulares y Telefonía"
                        },
                        {
                            "id": "MLU1055",
                            "name": "Celulares y Smartphones"
                        }
                    ]
                }
            ]
        },
        {
            "id": "BRAND",
            "name": "Marca",
            "type": "STRING",
            "values": [
                {
                    "id": "2503",
                    "name": "Motorola"
                }
            ]
        }
    ],
    "available_filters": [
        {
            "id": "state",
            "name": "Ubicación",
            "type": "text",
            "values": [
                {
                    "id": "UY-MO",
                    "name": "Montevideo",
                    "results": 4
                },
                {
                    "id": "UY-CA",
                    "name": "Canelones",
                    "results": 1
                },
                {
                    "id": "UY-SJ",
                    "name": "San José",
                    "results": 1
                }
            ]
        },
        {
            "id": "price",
            "name": "Precio",
            "type": "range",
            "values": [
                {
                    "id": "*-1500.0",
                    "name": "Hasta $1.500",
                    "results": 2
                },
                {
                    "id": "1500.0-4500.0",
                    "name": "$1.500 a $4.500",
                    "results": 2
                },
                {
                    "id": "4500.0-*",
                    "name": "Más de $4.500",
                    "results": 2
                }
            ]
        },
        {
            "id": "accepts_mercadopago",
            "name": "Filtro por MercadoPago",
            "type": "boolean",
            "values": [
                {
                    "id": "yes",
                    "name": "Con MercadoPago",
                    "results": 6
                }
            ]
        },
        {
            "id": "installments",
            "name": "Pago",
            "type": "text",
            "values": [
                {
                    "id": "yes",
                    "name": "En cuotas",
                    "results": 6
                }
            ]
        },
        {
            "id": "shipping",
            "name": "Envío",
            "type": "text",
            "values": [
                {
                    "id": "mercadoenvios",
                    "name": "Mercado Envíos",
                    "results": 6
                }
            ]
        },
        {
            "id": "since",
            "name": "Filtro por fecha de comienzo",
            "type": "text",
            "values": [
                {
                    "id": "today",
                    "name": "Publicados hoy",
                    "results": 1
                }
            ]
        },
        {
            "id": "has_pictures",
            "name": "Filtro por publicaciones con imágenes",
            "type": "boolean",
            "values": [
                {
                    "id": "yes",
                    "name": "Con fotos",
                    "results": 6
                }
            ]
        },
        {
            "id": "shipping_cost",
            "name": "Costo de envío",
            "type": "text",
            "values": [
                {
                    "id": "free",
                    "name": "Gratis",
                    "results": 2
                }
            ]
        },
        {
            "id": "CARRIER",
            "name": "Compañía telefónica",
            "type": "STRING",
            "values": [
                {
                    "id": "298335",
                    "name": "Liberado",
                    "results": 6
                }
            ]
        },
        {
            "id": "INTERNAL_MEMORY",
            "name": "Memoria interna",
            "type": "range",
            "values": [
                {
                    "id": "(*-64GB)",
                    "name": "Menos de 64 GB",
                    "results": 5
                },
                {
                    "id": "[64GB-*)",
                    "name": "64 GB o más",
                    "results": 1
                }
            ]
        },
        {
            "id": "IS_DUAL_SIM",
            "name": "Otras características",
            "type": "boolean",
            "values": [
                {
                    "id": "242085",
                    "name": "Es Dual SIM",
                    "results": 2
                }
            ]
        },
        {
            "id": "ITEM_CONDITION",
            "name": "Condición",
            "type": "STRING",
            "values": [
                {
                    "id": "2230581",
                    "name": "Usado",
                    "results": 6
                }
            ]
        },
        {
            "id": "LINE",
            "name": "Línea",
            "type": "STRING",
            "values": [
                {
                    "id": "3073863",
                    "name": "Moto G",
                    "results": 6
                }
            ]
        },
        {
            "id": "MAIN_COLOR",
            "name": "Color principal",
            "type": "list",
            "values": [
                {
                    "id": "2450293",
                    "name": "Azul",
                    "results": 3
                },
                {
                    "id": "2450295",
                    "name": "Negro",
                    "results": 1
                }
            ]
        },
        {
            "id": "MAIN_REAR_CAMERA_RESOLUTION",
            "name": "Resolución de la cámara trasera principal",
            "type": "range",
            "values": [
                {
                    "id": "(*-13Mpx)",
                    "name": "13 Mpx o menos",
                    "results": 4
                },
                {
                    "id": "[13Mpx-*)",
                    "name": "13 Mpx o más",
                    "results": 2
                }
            ]
        },
        {
            "id": "MOBILE_NETWORK",
            "name": "Red",
            "type": "STRING",
            "values": [
                {
                    "id": "367876",
                    "name": "4G/LTE",
                    "results": 6
                }
            ]
        },
        {
            "id": "MODEL",
            "name": "Modelo",
            "type": "STRING",
            "values": [
                {
                    "id": "8074",
                    "name": "G6",
                    "results": 3
                },
                {
                    "id": "483571",
                    "name": "G6 Dual SIM",
                    "results": 1
                },
                {
                    "id": "2876819",
                    "name": "G6 Play Dual SIM",
                    "results": 1
                },
                {
                    "id": "2876818",
                    "name": "G6 Play",
                    "results": 1
                }
            ]
        },
        {
            "id": "OPERATING_SYSTEM_NAME",
            "name": "Nombre del sistema operativo",
            "type": "STRING",
            "values": [
                {
                    "id": "7403813",
                    "name": "Android",
                    "results": 6
                }
            ]
        },
        {
            "id": "RAM",
            "name": "Memoria RAM",
            "type": "range",
            "values": [
                {
                    "id": "[3GB-3GB]",
                    "name": "3 GB",
                    "results": 5
                },
                {
                    "id": "[4GB-4GB]",
                    "name": "4 GB",
                    "results": 1
                }
            ]
        },
        {
            "id": "WITH_FACIAL_RECOGNITION",
            "name": "Otras características",
            "type": "boolean",
            "values": [
                {
                    "id": "242085",
                    "name": "Con reconocimiento facial",
                    "results": 2
                }
            ]
        },
        {
            "id": "WITH_FINGERPRINT_READER",
            "name": "Otras características",
            "type": "boolean",
            "values": [
                {
                    "id": "242085",
                    "name": "Con lector de huella digital",
                    "results": 6
                }
            ]
        }
    ]
}
"""
}
