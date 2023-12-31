import Fluent

struct CreateUser: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users")
            .field("id", .string, .required)
            .field("name", .string, .required)
            .field("phone", .string, .required)
            .field("email", .string, .required)
            .field("branch", .string, .required)
            .field("gender", .string, .required)
            .unique(on: "id")
            .unique(on: "email")
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users").delete()
    }
}
