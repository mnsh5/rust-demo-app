use serde::{Deserialize, Serialize};
use validator::Validate;

#[derive(Validate, Deserialize, Serialize, Debug)]
pub struct User {
    pub uuid: String,
    pub username: String,
    pub password: String,
    pub email: String,
    pub country: String,
    pub is_active: Bool,
}

impl User {
    pub fn new(uuid: String, username: String) -> User {
        User { uuid, username }
    }
}
