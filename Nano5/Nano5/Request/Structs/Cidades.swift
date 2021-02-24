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
                ["nome": "sao paulo",
                        "coord": [
                            "lon": -46.6361,
                            "lat":  -23.5475
                        ]
                    ],
                    ["nome": "rio de janeiro",
                        "coord": [
                            "lon":  -43.2075,
                            "lat":  -22.9028
                        ]
                    ],
                    [
                        "nome": "brasilia",
                        "coord": [
                            "lon":  -47.9297,
                            "lat":  -15.7797
                        ]
                    ],
                    [
                        "nome": "salvador",
                        "coord": [
                            "lon":  -88.9167,
                            "lat":  13.8333
                        ]
                    ],
                    [
                        "nome": "fortaleza",
                        "coord": [
                            "lon":  -38.5247,
                            "lat":  -3.7227
                        ]
                    ],
                    [
                        "nome": "belo horizonte",
                        "coord": [
                            "lon": -43.9378,
                            "lat": -19.9208
                        ]
                    ],
                    [
                        "nome": "manaus",
                        "coord": [
                            "lon": 1.1549,
                            "lat": 45.618
                        ]
                    ],
                    [
                        "nome": "curitiba",
                        "coord": [
                            "lon": -49.2908,
                            "lat": -25.504
                        ]
                    ],
                    [
                        "nome": "recife",
                        "coord": [
                            "lon": -34.8811,
                            "lat": -8.0539
                        ]
                    ],
                    [
                        "nome": "goiania",
                        "coord": [
                            "lon": -49.2539,
                            "lat": -16.6786
                        ]
                    ],
                    [
                        "nome": "belem",
                        "coord": [
                            "lon": -48.5044,
                            "lat": -1.4558
                        ]
                    ],
                    [
                        "nome": "porto alegre",
                        "coord": [
                            "lon": -51.23,
                            "lat": -30.0331
                        ]
                    ],
                    [
                        "nome": "guarulhos",
                        "coord": [
                            "lon": -46.5333,
                            "lat": -23.4628
                        ]
                    ],
                    [
                        "nome": "campinas",
                        "coord": [
                            "lon": -47.0608,
                            "lat": -22.9056
                        ]
                    ],
                    [
                        "nome": "sao luis",
                        "coord": [
                            "lon": -44.3028,
                            "lat": -2.5297
                        ]
                    ],
                    [
                        "nome": "sao goncalo",
                        "coord": [
                            "lon": -43.0411,
                            "lat": -22.8156
                        ]
                    ],
                    [
                        "nome": "maceio",
                        "coord": [
                            "lon": -35.7353,
                            "lat": -9.6658
                        ]
                    ],
                    [
                        "nome": "duque de caxias",
                        "coord": [
                            "lon": -43.3117,
                            "lat": -22.7856
                        ]
                    ],
                    [
                        "nome": "campo grande",
                        "coord": [
                            "lon": -54.6464,
                            "lat": -20.4428
                        ]
                    ],
                    [
                        "nome": "natal",
                        "coord": [
                            "lon": -35.2094,
                            "lat": -5.795
                        ]
                    ],
                    [
                        "nome": "teresina",
                        "coord": [
                            "lon": -42.8019,
                            "lat": -5.0892
                        ]
                    ],
                    [
                        "nome": "sao bernardo do campo",
                        "coord": [
                            "lon": -46.565,
                            "lat": -23.6939
                        ]
                    ],
                    [
                        "nome": "nova iguacu",
                        "coord": [
                            "lon": -43.4511,
                            "lat": -22.7592
                        ]
                    ],
                    [
                        "nome": "joao pessoa",
                        "coord": [
                            "lon": -34.8631,
                            "lat": -7.115
                        ]
                    ],
                    [
                        "nome": "sao jose dos campos",
                        "coord": [
                            "lon": -45.8869,
                            "lat": -23.1794
                        ]
                    ],
                    [
                        "nome": "santo andre",
                        "coord": [
                            "lon": -46.5383,
                            "lat": -23.6639
                        ]
                    ],
                    [
                        "nome": "ribeirao preto",
                        "coord": [
                            "lon": -47.8103,
                            "lat": -21.1775
                        ]
                    ],
                    [
                        "nome": "jaboatao dos guararapes",
                        "coord": [
                            "lon": -34.9738,
                            "lat": -8.1457
                        ]
                    ],
                    [
                        "nome": "osasco",
                        "coord": [
                            "lon": -46.7917,
                            "lat": -23.5325
                        ]
                    ],
                    [
                        "nome": "uberlandia",
                        "coord": [
                            "lon": -48.2772,
                            "lat": -18.9186
                        ]
                    ]
                ]
            ]
    
    func recebe() -> [String : [[String : Any]]]{
        return cities
    }
}

