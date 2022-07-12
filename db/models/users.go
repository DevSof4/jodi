package models

import "time"

type User struct {
	ID       int64  `json:"id,omitempty"`
	Name     string `json:"name,omitempty"`
	Email    string `json:"email,omitempty"`
	GoogleId string `json:"google_id,omitempty"`
	UserName string `json:"full_name,omitempty"`
	Password string ` json:"password,omitempty"`
	//PlanType           int64     `json:"plan_type,omitempty"`
	Token              string     `json:"token,omitempty"`
	OTP                string     `json:"otp,omitempty"`
	IsVerified         int        `json:"is_verified,omitempty"`
	CreatedAt          *time.Time ` json:"created_at,omitempty"`
	UpdatedAt          *time.Time ` json:"updated_at,omitempty"`
	DetailID           int64      `json:"detail_id,omitempty"`
	UserID             int64      `json:"user_id,omitempty"`
	Community          string     ` json:"community,omitempty"`
	DOB                string     `json:"date_of_birth,omitempty"`
	Zodiac             string     `json:"zodiac,omitempty"`
	NumberOfChildren   string     `json:"number_of_children,omitempty"`
	CurrentAddress     string     ` json:"current_address,omitempty"`
	MaritalStatus      string     ` json:"marital_status,omitempty"`
	Citizenship        string     ` json:"citizenship,omitempty"`
	Country            string     ` json:"country,omitempty"`
	District           string     ` json:"district,omitempty"`
	Eduction           string     ` json:"education,omitempty"`
	PlanId             int64      ` json:"plan_id"`
	Siblings           string     ` json:"siblings,omitempty"`
	Religion           string     ` json:"religion,omitempty"`
	Height             string     ` json:"height,omitempty"`
	Age                int32      `json:"age,omitempty"`
	Bio                string     ` json:"bio,omitempty"`
	Profession         string     ` json:"profession,omitempty"`
	Caste              string     ` json:"caste,omitempty"`
	Path1              string     ` json:"path1,omitempty"`
	Path2              string     ` json:"path2,omitempty"`
	Path3              string     ` json:"path3,omitempty"`
	InterestedIn       string     ` json:"interested_in,omitempty"`
	Gender             string     ` json:"gender,omitempty"`
	Status             string     ` json:"status,omitempty"`
	SentStatus         string     ` json:"friend_status,omitempty"`
	FavStatus1         string     ` json:"fav_status1,omitempty"`
	FavStatus          bool       ` json:"fav_status"`
	BlockStatus        string     ` json:"block_status,omitempty"`
	ResidentStatus     string     ` json:"resident_status,omitempty"`
	DateOfSubscription string     ` json:"date_of_subscription,omitempty"`
	IsOnline           bool       ` json:"is_online,omitempty"`
	LastMessage        string     ` json:"last_message,omitempty"`
	SentAt             *time.Time `json:"sent_at,omitempty"`
	MessageRead        bool       `json:"message_read,omitempty"`
	PaidAt             time.Time  `json:"-"`
}
