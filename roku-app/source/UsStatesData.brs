function us_states_database() as Object
d = [
    {
        "name": "Alabama",
        "capital": "Montgomery",
        "abbreviation": "al",
        "year_joined_union": 1819,
        "description": "The Heart of Dixie, known for its rich history, beautiful beaches, and warm hospitality.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            696.4824500000001,
            385.13822999999996,
            772.3019,
            506.39665999999994
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 507,
            "y": 799,
            "width": 72,
            "height": 117,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Alaska",
        "capital": "Juneau",
        "abbreviation": "ak",
        "year_joined_union": 1959,
        "description": "The Last Frontier, a vast state with stunning natural beauty, including mountains, glaciers, and the Arctic tundra.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            38.47851099999999,
            461.91074000000015,
            266.8739000000001,
            633.5612300000001
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 2,
            "y": 525,
            "width": 225,
            "height": 168,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Arizona",
        "capital": "Phoenix",
        "abbreviation": "az",
        "year_joined_union": 1912,
        "description": "The Grand Canyon State, known for its stunning landscapes, including deserts, mountains, and the Grand Canyon.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            173.18035000000003,
            315.90299,
            305.20632,
            468.81796999999995
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 334,
            "y": 260,
            "width": 128,
            "height": 149,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Arkansas",
        "capital": "Little Rock",
        "abbreviation": "ar",
        "year_joined_union": 1836,
        "description": "The Natural State, known for its beautiful forests, rivers, and mountains.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            571.14837,
            356.38891999999976,
            670.65639,
            446.31382999999977
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 916,
            "y": 86,
            "width": 96,
            "height": 86,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "California",
        "capital": "Sacramento",
        "abbreviation": "ca",
        "year_joined_union": 1850,
        "description": "The Golden State, known for its diverse culture, stunning beaches, and technology industry.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            43.00087400000002,
            155.57442999999998,
            198.50006000000005,
            417.67218999999994
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 2,
            "y": 263,
            "width": 152,
            "height": 258,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Colorado",
        "capital": "Denver",
        "abbreviation": "co",
        "year_joined_union": 1876,
        "description": "The Centennial State, known for its Rocky Mountains, skiing, and outdoor recreation.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            301.20632,
            236.11557000000005,
            441.95398,
            348.43695
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 465,
            "y": 2,
            "width": 137,
            "height": 108,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Connecticut",
        "capital": "Hartford",
        "abbreviation": "ct",
        "year_joined_union": 1788,
        "description": "The Constitution State, known for its historic sites, beautiful coastline, and strong educational institutions.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            888.98662,
            116.35382,
            990.943076,
            224.925726
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 748,
            "y": 206,
            "width": 98,
            "height": 105,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Delaware",
        "capital": "Dover",
        "abbreviation": "de",
        "year_joined_union": 1787,
        "description": "The First State, known for its beaches, historic sites, and tax-free shopping.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            848.726,
            185.20974,
            960.204246,
            300.493916
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 572,
            "y": 114,
            "width": 107,
            "height": 111,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Florida",
        "capital": "Tallahassee",
        "abbreviation": "fl",
        "year_joined_union": 1845,
        "description": "The Sunshine State, known for its beautiful beaches, theme parks, and warm weather.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            715.2179600000002,
            473.86269999999996,
            891.17546,
            624.40883
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 158,
            "y": 263,
            "width": 172,
            "height": 146,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Georgia",
        "capital": "Atlanta",
        "abbreviation": "ga",
        "year_joined_union": 1788,
        "description": "The Peach State, known for its historic sites, beautiful beaches, and film industry.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            745.6900800000002,
            378.78538999999995,
            852.19699,
            489.59930999999995
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 401,
            "y": 814,
            "width": 102,
            "height": 107,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Hawaii",
        "capital": "Honolulu",
        "abbreviation": "hi",
        "year_joined_union": 1959,
        "description": "The Aloha State, known for its beautiful beaches, volcanoes, and tropical climate.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            273.10305000000005,
            545.25145,
            398.66850000000017,
            628.6081600000001
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 885,
            "y": 2,
            "width": 122,
            "height": 80,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Idaho",
        "capital": "Boise",
        "abbreviation": "id",
        "year_joined_union": 1890,
        "description": "The Gem State, known for its stunning mountains, forests, and outdoor recreation.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            179.64086999999998,
            25.93332799999998,
            295.73089,
            211.36625999999998
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 231,
            "y": 413,
            "width": 112,
            "height": 181,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Illinois",
        "capital": "Springfield",
        "abbreviation": "il",
        "year_joined_union": 1818,
        "description": "The Prairie State, known for its diverse culture, historic sites, and vibrant cities.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            625.9551100000001,
            210.81186999999977,
            705.43552,
            347.5755500000001
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 440,
            "y": 662,
            "width": 75,
            "height": 133,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Indiana",
        "capital": "Indianapolis",
        "abbreviation": "in",
        "year_joined_union": 1816,
        "description": "The Hoosier State, known for its diverse culture, beautiful lakes, and motorsports.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            692.7138199999999,
            222.22545999999986,
            754.32012,
            327.11724
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 850,
            "y": 168,
            "width": 57,
            "height": 101,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Iowa",
        "capital": "Des Moines",
        "abbreviation": "ia",
        "year_joined_union": 1846,
        "description": "The Hawkeye State, known for its fertile farmland, beautiful landscapes, and friendly people.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            535.2924800000002,
            190.56891000000002,
            651.8131999999998,
            269.18791000000004
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 512,
            "y": 920,
            "width": 113,
            "height": 74,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Kansas",
        "capital": "Topeka",
        "abbreviation": "ks",
        "year_joined_union": 1861,
        "description": "The Sunflower State, known for its prairies, historic sites, and diverse culture.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            431.27810999999997,
            272.29448,
            574.9330199999999,
            351.66721
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 625,
            "y": 326,
            "width": 140,
            "height": 76,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Kentucky",
        "capital": "Frankfort",
        "abbreviation": "ky",
        "year_joined_union": 1792,
        "description": "The Bluegrass State, known for its horse racing, bourbon whiskey, and beautiful landscapes.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            666.8717399999999,
            285.10784999999987,
            810.09594,
            359.74286000000006
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 742,
            "y": 2,
            "width": 139,
            "height": 71,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Louisiana",
        "capital": "Baton Rouge",
        "abbreviation": "la",
        "year_joined_union": 1812,
        "description": "The Pelican State, known for its Cajun and Creole culture, beautiful beaches, and vibrant music scene.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            584.2847600000001,
            440.91404999999986,
            694.77566,
            538.2685599999999
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 401,
            "y": 925,
            "width": 107,
            "height": 93,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Maine",
        "capital": "Augusta",
        "abbreviation": "me",
        "year_joined_union": 1820,
        "description": "The Pine Tree State, known for its beautiful coastline, forests, and seafood.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            957.2720999999998,
            35.83945799999998,
            1030.5072999999998,
            149.23759
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 611,
            "y": 624,
            "width": 70,
            "height": 109,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Maryland",
        "capital": "Annapolis",
        "abbreviation": "md",
        "year_joined_union": 1788,
        "description": "The Old Line State, known for its history, culture, and beautiful Chesapeake Bay.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            843.4592800000004,
            244.08355000000006,
            932.5227900000003,
            290.72298
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 266,
            "y": 963,
            "width": 86,
            "height": 43,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Massachusetts",
        "capital": "Boston",
        "abbreviation": "ma",
        "year_joined_union": 1788,
        "description": "The Bay State, known for its history, culture, and beautiful coastline.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            896.5229499999999,
            92.65824,
            1014.717832,
            219.826842
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 273,
            "y": 598,
            "width": 114,
            "height": 123,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Michigan",
        "capital": "Lansing",
        "abbreviation": "mi",
        "year_joined_union": 1837,
        "description": "The Great Lake State, known for its Great Lakes coastline, automotive industry, and diverse culture.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            636.9379900000001,
            76.971434,
            783.8231599999999,
            229.88642000000002
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 126,
            "y": 697,
            "width": 143,
            "height": 149,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Minnesota",
        "capital": "Saint Paul",
        "abbreviation": "mn",
        "year_joined_union": 1858,
        "description": "The North Star State, known for its beautiful lakes, forests, and Scandinavian heritage.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            525.7093800000002,
            54.14426400000006,
            654.3974099999999,
            196.29171000000002
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 138,
            "y": 850,
            "width": 124,
            "height": 138,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Mississippi",
        "capital": "Jackson",
        "abbreviation": "ms",
        "year_joined_union": 1817,
        "description": "The Magnolia State, known for its rich history, beautiful beaches, and warm hospitality.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            633.9230800000001,
            389.44523999999967,
            705.2201700000003,
            510.2729799999999
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 583,
            "y": 756,
            "width": 67,
            "height": 117,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Missouri",
        "capital": "Jefferson City",
        "abbreviation": "mo",
        "year_joined_union": 1821,
        "description": "The Show-Me State, known for its diverse culture, beautiful landscapes, and music scene.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            549.6133,
            260.01949999999994,
            679.2704099999996,
            372.5562300000001
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 391,
            "y": 549,
            "width": 125,
            "height": 109,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Montana",
        "capital": "Helena",
        "abbreviation": "mt",
        "year_joined_union": 1889,
        "description": "The Treasure State, known for its stunning mountains, forests, and outdoor recreation.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            226.04893000000007,
            29.16358800000001,
            422.24940000000004,
            155.05206
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 269,
            "y": 2,
            "width": 192,
            "height": 122,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Nebraska",
        "capital": "Lincoln",
        "abbreviation": "ne",
        "year_joined_union": 1867,
        "description": "The Cornhusker State, known for its fertile farmland, friendly people, and diverse culture.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            402.31344999999976,
            198.32153,
            561.1505699999998,
            279.74009
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 466,
            "y": 326,
            "width": 155,
            "height": 78,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Nevada",
        "capital": "Carson City",
        "abbreviation": "nv",
        "year_joined_union": 1864,
        "description": "The Silver State, known for its casinos, deserts, and mountains.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            111.37470999999994,
            175.60204000000002,
            235.00199999999995,
            364.3729
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 2,
            "y": 697,
            "width": 120,
            "height": 184,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "New Hampshire",
        "capital": "Concord",
        "abbreviation": "nh",
        "year_joined_union": 1788,
        "description": "The Granite State, known for its beautiful mountains, lakes, and historic sites.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            946.2892199999998,
            95.27624000000003,
            981.51506,
            164.63517000000002
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 629,
            "y": 953,
            "width": 32,
            "height": 66,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "New Jersey",
        "capital": "Trenton",
        "abbreviation": "nj",
        "year_joined_union": 1787,
        "description": "The Garden State, known for its diverse culture, beautiful beaches, and historic sites.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            913.55592,
            201.44412,
            942.42892,
            263.48112
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 391,
            "y": 662,
            "width": 24,
            "height": 58,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "New Mexico",
        "capital": "Santa Fe",
        "abbreviation": "nm",
        "year_joined_union": 1912,
        "description": "The Land of Enchantment, known for its diverse culture, stunning landscapes, and ancient history.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            282.47081000000003,
            331.19289000000003,
            417.51168,
            471.18683000000004
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 2,
            "y": 885,
            "width": 132,
            "height": 136,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "New York",
        "capital": "Albany",
        "abbreviation": "ny",
        "year_joined_union": 1788,
        "description": "The Empire State, known for its diverse culture, iconic landmarks, and financial industry.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            827.95403,
            111.53522000000004,
            974.5161699999999,
            223.8566
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 425,
            "y": 128,
            "width": 143,
            "height": 108,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "North Carolina",
        "capital": "Raleigh",
        "abbreviation": "nc",
        "year_joined_union": 1789,
        "description": "The Tar Heel State, known for its beautiful beaches, mountains, and historic sites.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            770.3477299999998,
            319.02558000000005,
            940.8137900000002,
            395.81410000000005
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 457,
            "y": 413,
            "width": 167,
            "height": 73,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "North Dakota",
        "capital": "Bismarck",
        "abbreviation": "nd",
        "year_joined_union": 1889,
        "description": "The Peace Garden State, known for its beautiful prairies, lakes, and friendly people.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            412.65027999999995,
            56.94382300000001,
            540.2615599999999,
            138.57774
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 789,
            "y": 86,
            "width": 123,
            "height": 78,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Ohio",
        "capital": "Columbus",
        "abbreviation": "oh",
        "year_joined_union": 1803,
        "description": "The Buckeye State, known for its diverse culture, industrial history, and beautiful landscapes.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            742.24447,
            206.50485999999995,
            825.27816,
            301.16748000000007
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 633,
            "y": 494,
            "width": 79,
            "height": 90,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Oklahoma",
        "capital": "Oklahoma City",
        "abbreviation": "ok",
        "year_joined_union": 1907,
        "description": "The Sooner State, known for its Native American heritage, beautiful landscapes, and rich history.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            412.86563000000024,
            343.36019999999996,
            579.5630600000001,
            431.56230999999997
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 273,
            "y": 725,
            "width": 163,
            "height": 85,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Oregon",
        "capital": "Salem",
        "abbreviation": "or",
        "year_joined_union": 1859,
        "description": "The Beaver State, known for its stunning coastlines, forests, and mountains.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            56.46029000000004,
            60.389432999999975,
            211.85180000000003,
            191.66167
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 269,
            "y": 128,
            "width": 152,
            "height": 128,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Pennsylvania",
        "capital": "Harrisburg",
        "abbreviation": "pa",
        "year_joined_union": 1787,
        "description": "The Keystone State, known for its rich history, diverse culture, and beautiful landscapes.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            816.0020699999999,
            189.16913000000002,
            929.4001999999996,
            263.91182
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 520,
            "y": 549,
            "width": 109,
            "height": 71,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Rhode Island",
        "capital": "Providence",
        "abbreviation": "ri",
        "year_joined_union": 1790,
        "description": "The Ocean State, known for its beautiful beaches, historic sites, and seafood.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            908.35917,
            115.13694,
            999.8198199999999,
            208.54812
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 519,
            "y": 662,
            "width": 88,
            "height": 90,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "South Carolina",
        "capital": "Columbia",
        "abbreviation": "sc",
        "year_joined_union": 1788,
        "description": "The Palmetto State, known for its beautiful beaches, historic cities, and warm hospitality.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            789.72929,
            369.63298,
            889.8833599999998,
            445.7754500000001
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 629,
            "y": 877,
            "width": 96,
            "height": 72,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "South Dakota",
        "capital": "Pierre",
        "abbreviation": "sd",
        "year_joined_union": 1889,
        "description": "The Mount Rushmore State, known for its beautiful landscapes, historic sites, and friendly people.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            406.2974400000003,
            128.76327000000003,
            542.1997200000002,
            220.41099000000003
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 606,
            "y": 2,
            "width": 132,
            "height": 87,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Tennessee",
        "capital": "Nashville",
        "abbreviation": "tn",
        "year_joined_union": 1796,
        "description": "The Volunteer State, known for its music, history, and beautiful landscapes.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            655.2428000000003,
            336.89968,
            819.4636900000002,
            396.2448000000002
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 457,
            "y": 490,
            "width": 160,
            "height": 55,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Texas",
        "capital": "Austin",
        "abbreviation": "tx",
        "year_joined_union": 1845,
        "description": "The Lone Star State, known for its diverse culture, beautiful landscapes, and rich history.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            331.89378,
            354.77378999999996,
            599.1599699999998,
            616.3331800000001
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 2,
            "y": 2,
            "width": 263,
            "height": 257,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Utah",
        "capital": "Salt Lake City",
        "abbreviation": "ut",
        "year_joined_union": 1896,
        "description": "The Beehive State, known for its stunning national parks, skiing, and Mormon culture.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            208.39017999999996,
            198.53688,
            317.58897999999994,
            335.19289
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 347,
            "y": 413,
            "width": 106,
            "height": 132,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Vermont",
        "capital": "Montpelier",
        "abbreviation": "vt",
        "year_joined_union": 1791,
        "description": "The Green Mountain State, known for its beautiful mountains, lakes, and maple syrup.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            922.2776200000001,
            104.10562000000003,
            958.04184,
            167.54240000000001
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 231,
            "y": 598,
            "width": 32,
            "height": 60,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Virginia",
        "capital": "Richmond",
        "abbreviation": "va",
        "year_joined_union": 1788,
        "description": "The Old Dominion, known for its rich history, beautiful beaches, and diverse culture.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            779.1771100000004,
            259.80415000000005,
            931.33836,
            346.0681000000002
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 466,
            "y": 240,
            "width": 148,
            "height": 82,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Washington",
        "capital": "Olympia",
        "abbreviation": "wa",
        "year_joined_union": 1889,
        "description": "The Evergreen State, known for its stunning mountains, forests, and coastline.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            89.731967,
            1.9217286999999965,
            219.92745000000005,
            99.27623999999999
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 618,
            "y": 229,
            "width": 126,
            "height": 93,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "West Virginia",
        "capital": "Charleston",
        "abbreviation": "wv",
        "year_joined_union": 1863,
        "description": "The Mountain State, known for its beautiful mountains, forests, and historic sites.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            791.5597700000002,
            238.69977999999998,
            880.6232799999998,
            326.7942100000001
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 628,
            "y": 406,
            "width": 85,
            "height": 84,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Wisconsin",
        "capital": "Madison",
        "abbreviation": "wi",
        "year_joined_union": 1848,
        "description": "The Badger State, known for its beautiful lakes, forests, and cheese.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            597.0981200000002,
            105.07469999999996,
            702.6359600000001,
            217.82677999999999
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 683,
            "y": 93,
            "width": 102,
            "height": 109,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    },
    {
        "name": "Wyoming",
        "capital": "Cheyenne",
        "abbreviation": "wy",
        "year_joined_union": 1890,
        "description": "The Cowboy State, known for its stunning landscapes, wildlife, and outdoor recreation.",
        "map_url": "pkg:/images/usa/usa_none.png",
        "bb": [
            279.02520000000004,
            136.83892,
            414.49678,
            249.91402999999997
        ],
        "atlas": "pkg:/images/usa/usa_atlas.png",
        "atlas_rect": {
            "x": 266,
            "y": 850,
            "width": 131,
            "height": 109,
            "atlas_width": 1024,
            "atlas_height": 1024
        }
    }
]
return d
end function
