package util

import "time"

func CheckAuthorization(planID int64, paidAt time.Time, plan string) bool {

	//paidAtTime := time.Unix(paidAt, 0)
	var expiryTime time.Time

	switch planID {
	case 1:
		expiryTime = paidAt.Add(time.Hour * 24 * 30)
	case 2, 3:
		expiryTime = paidAt.Add(time.Hour * 24 * 180)
	}

	switch plan {
	case "PREMIUM":
		if planID < 3 {
			return false
		}
		if time.Now().After(expiryTime) {
			return false
		}
		return true
	case "BASIC":
		if planID < 1 {
			return false
		}
		if time.Now().After(expiryTime) {
			return false
		}
		return true
	default:
		return true
	}

}

func CheckAuthorizationV2(planID int64, paidAt time.Time, plan string) bool {

	//paidAtTime := time.Unix(paidAt, 0)
	var expiryTime time.Time

	switch planID {
	case 1:
		expiryTime = paidAt.Add(time.Hour * 24 * 90)
	case 2:
		expiryTime = paidAt.Add(time.Hour * 24 * 180)
	}

	switch plan {
	case "PREMIUM":
		if planID < 2 {
			return false
		}
		if time.Now().After(expiryTime) {
			return false
		}
		return true
	case "BASIC":
		if planID < 1 {
			return false
		}
		if time.Now().After(expiryTime) {
			return false
		}
		return true
	default:
		return true
	}

}
