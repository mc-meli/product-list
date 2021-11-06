//
//  ProductInfoTests.swift
//  ProductListTests
//
//  Created by Test on 6/11/21.
//

import XCTest
@testable import ProductList

class ProductInfoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_FromJSON_min() throws {
        let productInfo = try? ProductInfo.fromJSONString(ProductInfoTestsData.product_json_min)
        XCTAssertNotNil(productInfo)
        if let productInfo = productInfo {
            XCTAssertEqual(productInfo.id, ProductInfoTestsData.product_1_id)
            XCTAssertEqual(productInfo.title, ProductInfoTestsData.product_1_title)
            XCTAssertEqual(productInfo.price, ProductInfoTestsData.product_1_price)
            XCTAssertEqual(productInfo.currency, ProductInfoTestsData.product_1_currency)
            XCTAssertEqual(productInfo.condition, ProductInfoTestsData.product_1_condition)
            XCTAssertEqual(productInfo.permalink.absoluteString, ProductInfoTestsData.product_1_permalink)
            XCTAssertEqual(productInfo.thumbnail.absoluteString, ProductInfoTestsData.product_1_thumbnail)
        }
    }
    
    func test_FromJSON_full() throws {
        let productInfo = try? ProductInfo.fromJSONString(ProductInfoTestsData.product_json_full)
        XCTAssertNotNil(productInfo)
        if let productInfo = productInfo {
            XCTAssertEqual(productInfo.id, ProductInfoTestsData.product_1_id)
            XCTAssertEqual(productInfo.title, ProductInfoTestsData.product_1_title)
            XCTAssertEqual(productInfo.price, ProductInfoTestsData.product_1_price)
            XCTAssertEqual(productInfo.currency, ProductInfoTestsData.product_1_currency)
            XCTAssertEqual(productInfo.condition, ProductInfoTestsData.product_1_condition)
            XCTAssertEqual(productInfo.permalink.absoluteString, ProductInfoTestsData.product_1_permalink)
            XCTAssertEqual(productInfo.thumbnail.absoluteString, ProductInfoTestsData.product_1_thumbnail)
        }
    }
    
    func test_FromJSON_missing_fields() throws {
        XCTAssertThrowsError(try ProductInfo.fromJSONString(ProductInfoTestsData.product_json_missing_fields), "fromJSONString should throw for an invalid JSON") { error in
            print(error)
        }
    }
    
    func test_FromJSON_invalid_names() throws {
        XCTAssertThrowsError(try ProductInfo.fromJSONString(ProductInfoTestsData.product_json_invalid_names), "fromJSONString should throw for an invalid JSON") { error in
            print(error)
        }
    }

}

struct ProductInfoTestsData {
    static let product_1_id = "MLU602962743"
    static let product_1_title = "Moto G6 Play (sin Tapa Trasera) Libre Oferta!!!"
    static let product_1_price = 1999
    static let product_1_currency = "UYU"
    static let product_1_condition = "used"
    static let product_1_permalink = "https://articulo.mercadolibre.com.uy/MLU-602962743-moto-g6-play-sin-tapa-trasera-libre-oferta-_JM"
    static let product_1_thumbnail = "http://http2.mlstatic.com/D_776681-MLU47932898328_102021-O.jpg"
    
    static let product_json_min = """
{
            "id": "\(product_1_id)",
            "title": "\(product_1_title)",
            "price": \(product_1_price),
            "currency_id": "\(product_1_currency)",
            "condition": "\(product_1_condition)",
            "permalink": "\(product_1_permalink)",
            "thumbnail": "\(product_1_thumbnail)"
        }
"""

    static let product_json_missing_fields = """
{
            "id": "\(product_1_id)",
            "title": "\(product_1_title)"
        }
"""

    static let product_json_invalid_names = """
{
            "x_id": "\(product_1_id)",
            "x_title": "\(product_1_title)",
            "x_price": \(product_1_price),
            "x_currency_id": "\(product_1_currency)",
            "x_permalink": "\(product_1_permalink)",
            "x_thumbnail": "\(product_1_thumbnail)"
        }
"""

    static let product_json_full = """
{
            "id": "\(product_1_id)",
            "site_id": "MLU",
            "title": "\(product_1_title)",
            "seller": {
                "id": 111033698,
                "permalink": null,
                "registration_date": null,
                "car_dealer": false,
                "real_estate_agency": false,
                "tags": null
            },
            "price": \(product_1_price),
            "prices": {
                "id": "\(product_1_id)",
                "prices": [
                    {
                        "id": "4",
                        "type": "standard",
                        "amount": \(product_1_price),
                        "regular_amount": null,
                        "currency_id": "\(product_1_currency)",
                        "last_updated": "2021-10-28T04:08:41Z",
                        "conditions": {
                            "context_restrictions": [],
                            "start_time": null,
                            "end_time": null,
                            "eligible": true
                        },
                        "exchange_rate_context": "DEFAULT",
                        "metadata": {}
                    }
                ],
                "presentation": {
                    "display_currency": "\(product_1_currency)"
                },
                "payment_method_prices": [],
                "reference_prices": [],
                "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "\(product_1_currency)",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_special",
            "stop_time": "2041-10-14T14:57:35.000Z",
            "condition": "\(product_1_condition)",
            "permalink": "\(product_1_permalink)",
            "thumbnail": "\(product_1_thumbnail)",
            "thumbnail_id": "776681-MLU47932898328_102021",
            "accepts_mercadopago": true,
            "installments": null,
            "address": {
                "state_id": "UY-MO",
                "state_name": "Montevideo",
                "city_id": "TUxVQ0pBUjMzOTE",
                "city_name": "Jardines Hipódromo"
            },
            "shipping": {
                "free_shipping": true,
                "mode": "me2",
                "tags": [],
                "logistic_type": "drop_off",
                "store_pick_up": false
            },
            "seller_address": {
                "id": "",
                "comment": "",
                "address_line": "",
                "zip_code": "",
                "country": {
                    "id": "UY",
                    "name": "Uruguay"
                },
                "state": {
                    "id": "UY-MO",
                    "name": "Montevideo"
                },
                "city": {
                    "id": "TUxVQ0pBUjMzOTE",
                    "name": "Jardines Hipódromo"
                },
                "latitude": "",
                "longitude": ""
            },
            "attributes": [
                {
                    "value_name": "Motorola",
                    "values": [
                        {
                            "id": "2503",
                            "name": "Motorola",
                            "struct": null,
                            "source": 1505
                        }
                    ],
                    "attribute_group_id": "OTHERS",
                    "attribute_group_name": "Otros",
                    "source": 1505,
                    "id": "BRAND",
                    "name": "Marca",
                    "value_id": "2503",
                    "value_struct": null
                },
                {
                    "value_struct": null,
                    "attribute_group_id": "OTHERS",
                    "attribute_group_name": "Otros",
                    "source": 1505,
                    "name": "Condición del ítem",
                    "value_id": "2230581",
                    "value_name": "Usado",
                    "values": [
                        {
                            "id": "2230581",
                            "name": "Usado",
                            "struct": null,
                            "source": 1505
                        }
                    ],
                    "id": "ITEM_CONDITION"
                },
                {
                    "value_name": "Moto G",
                    "attribute_group_id": "OTHERS",
                    "attribute_group_name": "Otros",
                    "id": "LINE",
                    "value_id": "3073863",
                    "value_struct": null,
                    "values": [
                        {
                            "struct": null,
                            "source": 1505,
                            "id": "3073863",
                            "name": "Moto G"
                        }
                    ],
                    "source": 1505,
                    "name": "Línea"
                },
                {
                    "source": 1505,
                    "id": "MODEL",
                    "name": "Modelo",
                    "value_id": "2876818",
                    "values": [
                        {
                            "id": "2876818",
                            "name": "G6 Play",
                            "struct": null,
                            "source": 1505
                        }
                    ],
                    "attribute_group_id": "OTHERS",
                    "attribute_group_name": "Otros",
                    "value_name": "G6 Play",
                    "value_struct": null
                }
            ],
            "original_price": null,
            "category_id": "MLU1055",
            "official_store_id": null,
            "domain_id": "MLU-CELLPHONES",
            "catalog_product_id": "MLU9413721",
            "tags": [
                "poor_quality_picture",
                "immediate_payment",
                "cart_eligible"
            ],
            "order_backend": 1,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null
        }
"""
}
