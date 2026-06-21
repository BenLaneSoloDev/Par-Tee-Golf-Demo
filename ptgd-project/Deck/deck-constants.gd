class_name Deck

enum Type { Draw, Course, Discard }

static var drawPileDB = {
	"AmPu": 8,
	"AmIr": 11,
	"AmDr": 6,
	"AdPi": 9,
	"AdIr": 10,
	"AdDr": 5,
	"PrIr": 9,
	"PrDr": 4,
	"SpHc": 4,
	"SpHio": 1,
	"PtCa": 7,
	"PtCp": 5,
	"PtLd": 3
}

static var coursePileDB = {
	"ccp3d15": 1,
	"ccp3d16": 1,
	"ccp3d17": 1,
	"ccp3d18": 1,
	"ccp3d19": 1,
	"ccp3d20": 1,
	"ccp4d19": 1,
	"ccp4d20": 1,
	"ccp4d21": 1,
	"ccp4d22": 1,
	"ccp4d23": 1,
	"ccp4d24": 1,
	"ccp5d23": 1,
	"ccp5d24": 1,
	"ccp5d25": 1,
	"ccp5d26": 1,
	"ccp5d27": 1,
	"ccp5d28": 1
}

static func getCardData(cardType: String):
	return load("res://Deck/Cards/Resources/" + cardType + ".tres")

# Function for getting starting card totals for a given deck
static func getDB(pileType: Type):
	match pileType:
		Type.Draw:
			return drawPileDB
		Type.Course:
			return coursePileDB
	return {}
