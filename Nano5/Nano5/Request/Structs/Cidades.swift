//
//  cidades.swift
//  Nano5
//
//  Created by Gustavo Rigor on 23/02/21.
//

import Foundation

class Cidades{
    var cities = ["cidades":
                    [
                        [
                            "nome": "sao paulo",
                            "lon": Float(-46.6361),
                            "lat":  Float(-23.5475)
                        ],
                        [
                            "nome": "rio de janeiro",
                            "lon":  Float(-43.2075),
                            "lat":  Float(-22.9028)
                        ],
                        [
                            "nome": "brasilia",
                            "lon":  Float(-47.9297),
                            "lat":  Float(-15.7797)
                        ],
                        [
                            "nome": "salvador",
                            "lon":  Float(-88.9167),
                            "lat":  Float(13.8333)
                        ],
                        [
                            "nome": "fortaleza",
                            "lon":  Float(-38.5247),
                            "lat":  Float(-3.7227)
                        ],
                        [
                            "nome": "belo horizonte",
                            "lon": Float(-43.9378),
                            "lat": Float(-19.9208)
                        ],
                        [
                            "nome": "manaus",
                            "lon": Float(1.1549),
                            "lat": Float(45.618)
                        ],
                        [
                            "nome": "curitiba",
                            "lon": Float(-49.2908),
                            "lat": Float(-25.504)
                        ],
                        [
                            "nome": "recife",
                            "lon": Float(-34.8811),
                            "lat": Float(-8.0539)
                        ],
                        [
                            "nome": "goiania",
                            "lon": Float(-49.2539),
                            "lat": Float(-16.6786)
                        ],
                        [
                            "nome": "belem",
                            "lon": Float(-48.5044),
                            "lat": Float(-1.4558)
                        ],
                        [
                            "nome": "porto alegre",
                            "lon": Float(-51.23),
                            "lat": Float(-30.0331)
                        ],
                        [
                            "nome": "guarulhos",
                            "lon": Float(-46.5333),
                            "lat": Float(-23.4628)
                        ],
                        [
                            "nome": "campinas",
                            "lon": Float(-47.0608),
                            "lat": Float(-22.9056)
                        ],
                        [
                            "nome": "sao luis",
                            "lon": Float(-44.3028),
                            "lat": Float(-2.5297)
                        ],
                        [
                            "nome": "sao goncalo",
                            "lon": Float(-43.0411),
                            "lat": Float(-22.8156)
                        ],
                        [
                            "nome": "maceio",
                            "lon": Float(-35.7353),
                            "lat": Float(-9.6658)
                        ],
                        [
                            "nome": "duque de caxias",
                            "lon": Float(-43.3117),
                            "lat": Float(-22.7856)
                        ],
                        [
                            "nome": "campo grande",
                            "lon": Float(-54.6464),
                            "lat": Float(-20.4428)
                        ],
                        [
                            "nome": "natal",
                            "lon": Float(-35.2094),
                            "lat": Float(-5.795)
                        ],
                        [
                            "nome": "teresina",
                            "lon": Float(-42.8019),
                            "lat": Float(-5.0892)
                        ],
                        [
                            "nome": "sao bernardo do campo",
                            "lon": Float(-46.565),
                            "lat": Float(-23.6939)
                        ],
                        [
                            "nome": "nova iguacu",
                            "lon": Float(-43.4511),
                            "lat": Float(-22.7592)
                        ],
                        [
                            "nome": "joao pessoa",
                            "lon": Float(-34.8631),
                            "lat": Float(-7.115)
                        ],
                        [
                            "nome": "sao jose dos campos",
                            "lon": Float(-45.8869),
                            "lat": Float(-23.1794)
                        ],
                        [
                            "nome": "santo andre",
                            "lon": Float(-46.5383),
                            "lat": Float(-23.6639)
                        ],
                        [
                            "nome": "ribeirao preto",
                            "lon": Float(-47.8103),
                            "lat": Float(-21.1775)
                        ],
                        [
                            "nome": "jaboatao dos guararapes",
                            "lon": Float(-34.9738),
                            "lat": Float(-8.1457)
                        ],
                        [
                            "nome": "osasco",
                            "lon": Float(-46.7917),
                            "lat": Float(-23.5325)
                        ],
                        [
                            "nome": "uberlandia",
                            "lon": Float(-48.2772),
                            "lat": Float(-18.9186)
                        ]
                    ]
    ]
    
    func recebe() -> [String : [[String : Any]]]{
        return cities
    }

}
