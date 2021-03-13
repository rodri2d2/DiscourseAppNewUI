import Foundation

// MARK: - SingleTopicResponse

struct SingleTopicResponse: Codable {

    let postStream: PostStream

    let timelineLookup: [[Int]]

    let suggestedTopics: [SuggestedTopic]

    let id: Int

    let title: String

    let fancyTitle: String

    let postsCount: Int

    let createdAt: String

    let views: Int

    let replyCount: Int

    let likeCount: Int

    let lastPostedAt: String

    let visible: Bool

    let closed: Bool

    let archived: Bool

    let hasSummary: Bool

    let archetype: String

    let slug: String

    let categoryID: Int

    let wordCount: Int

    let userID: Int

    let pinnedGlobally: Bool

    let draftKey: String

    let draftSequence: Int

    let posted: Bool?

    let pinned: Bool

    let currentPostNumber: Int

    let highestPostNumber: Int

    let lastReadPostNumber: Int?

    let lastReadPostID: Int?

    let actionsSummary: [LatestTopicsResponseActionsSummary]

    let chunkSize: Int

    let bookmarked: Bool?

    let messageBusLastID: Int

    let participantCount: Int

    let details: Details



    enum CodingKeys: String, CodingKey {

        case postStream = "post_stream"

        case timelineLookup = "timeline_lookup"

        case suggestedTopics = "suggested_topics"

        case id = "id"

        case title = "title"

        case fancyTitle = "fancy_title"

        case postsCount = "posts_count"

        case createdAt = "created_at"

        case views = "views"

        case replyCount = "reply_count"

        case likeCount = "like_count"

        case lastPostedAt = "last_posted_at"

        case visible = "visible"

        case closed = "closed"

        case archived = "archived"

        case hasSummary = "has_summary"

        case archetype = "archetype"

        case slug = "slug"

        case categoryID = "category_id"

        case wordCount = "word_count"

        case userID = "user_id"

        case pinnedGlobally = "pinned_globally"

        case draftKey = "draft_key"

        case draftSequence = "draft_sequence"

        case posted = "posted"

        case pinned = "pinned"

        case currentPostNumber = "current_post_number"

        case highestPostNumber = "highest_post_number"

        case lastReadPostNumber = "last_read_post_number"

        case lastReadPostID = "last_read_post_id"

        case actionsSummary = "actions_summary"

        case chunkSize = "chunk_size"

        case bookmarked = "bookmarked"

        case messageBusLastID = "message_bus_last_id"

        case participantCount = "participant_count"

        case details = "details"

    }

}



// MARK: - LatestTopicsResponseActionsSummary

struct LatestTopicsResponseActionsSummary: Codable {

    let id: Int

    let count: Int

    let hidden: Bool

    let canAct: Bool



    enum CodingKeys: String, CodingKey {

        case id = "id"

        case count = "count"

        case hidden = "hidden"

        case canAct = "can_act"

    }

}



// MARK: - Details

struct Details: Codable {

    let notificationLevel: Int?

    let notificationsReasonID: Int?

    let canEdit: Bool?

    let canCreatePost: Bool?

    let canReplyAsNewTopic: Bool

    let canFlagTopic: Bool

    let participants: [Participant]

    let createdBy: CreatedBy

    let lastPoster: CreatedBy

    let canDelete: Bool?


    enum CodingKeys: String, CodingKey {

        case notificationLevel = "notification_level"

        case notificationsReasonID = "notifications_reason_id"

        case canEdit = "can_edit"

        case canCreatePost = "can_create_post"

        case canReplyAsNewTopic = "can_reply_as_new_topic"

        case canFlagTopic = "can_flag_topic"

        case participants = "participants"

        case createdBy = "created_by"

        case lastPoster = "last_poster"

        case canDelete = "can_delete"

    }

}



// MARK: - CreatedBy

struct CreatedBy: Codable {

    let id: Int

    let username: String

    let name: String?

    let avatarTemplate: String



    enum CodingKeys: String, CodingKey {

        case id = "id"

        case username = "username"

        case name = "name"

        case avatarTemplate = "avatar_template"

    }

}



// MARK: - Participant

struct Participant: Codable {

    let id: Int

    let username: String

    let name: String

    let avatarTemplate: String

    let postCount: Int



    enum CodingKeys: String, CodingKey {

        case id = "id"

        case username = "username"

        case name = "name"

        case avatarTemplate = "avatar_template"

        case postCount = "post_count"

    }

}



// MARK: - PostStream

struct PostStream: Codable {

    let posts: [Post]

    let stream: [Int]



    enum CodingKeys: String, CodingKey {

        case posts = "posts"

        case stream = "stream"

    }

}



// MARK: - Post

struct Post: Codable {

    let id: Int

    let name: String

    let username: String

    let avatarTemplate: String

    let createdAt: String

    let cooked: String

    let postNumber: Int

    let postType: Int

    let updatedAt: String

    let replyCount: Int

    let quoteCount: Int

    let incomingLinkCount: Int

    let reads: Int

    let score: Double

    let yours: Bool

    let topicID: Int

    let topicSlug: String

    let displayUsername: String

    let version: Int

    let canEdit: Bool?

    let canDelete: Bool

    let canRecover: Bool

    let canWiki: Bool

    let read: Bool

    let bookmarked: Bool?

    let actionsSummary: [PostActionsSummary]

    let moderator: Bool

    let admin: Bool

    let staff: Bool

    let userID: Int

    let hidden: Bool

    let trustLevel: Int

    let userDeleted: Bool

    let canViewEditHistory: Bool

    let wiki: Bool



    enum CodingKeys: String, CodingKey {

        case id = "id"

        case name = "name"

        case username = "username"

        case avatarTemplate = "avatar_template"

        case createdAt = "created_at"

        case cooked = "cooked"

        case postNumber = "post_number"

        case postType = "post_type"

        case updatedAt = "updated_at"

        case replyCount = "reply_count"

        case quoteCount = "quote_count"

        case incomingLinkCount = "incoming_link_count"

        case reads = "reads"

        case score = "score"

        case yours = "yours"

        case topicID = "topic_id"

        case topicSlug = "topic_slug"

        case displayUsername = "display_username"

        case version = "version"

        case canEdit = "can_edit"

        case canDelete = "can_delete"

        case canRecover = "can_recover"

        case canWiki = "can_wiki"

        case read = "read"

        case bookmarked = "bookmarked"

        case actionsSummary = "actions_summary"

        case moderator = "moderator"

        case admin = "admin"

        case staff = "staff"

        case userID = "user_id"

        case hidden = "hidden"

        case trustLevel = "trust_level"

        case userDeleted = "user_deleted"

        case canViewEditHistory = "can_view_edit_history"

        case wiki = "wiki"

    }

}



// MARK: - PostActionsSummary

struct PostActionsSummary: Codable {

    let id: Int

    let canAct: Bool



    enum CodingKeys: String, CodingKey {

        case id = "id"

        case canAct = "can_act"

    }

}



// MARK: - SuggestedTopic

struct SuggestedTopic: Codable {

    let id: Int

    let title: String

    let fancyTitle: String

    let slug: String

    let postsCount: Int

    let replyCount: Int

    let highestPostNumber: Int

    let imageURL: String?

    let createdAt: String

    let lastPostedAt: String

    let bumped: Bool

    let bumpedAt: String

    let unseen: Bool

    let lastReadPostNumber: Int?

    let unread: Int?

    let newPosts: Int?

    let pinned: Bool

    let unpinned: Bool?

    let visible: Bool

    let closed: Bool

    let archived: Bool

    let notificationLevel: Int?

    let bookmarked: Bool?

    let liked: Bool?

    let archetype: String

    let likeCount: Int

    let views: Int

    let categoryID: Int

    let posters: [PosterSingleTopic]



    enum CodingKeys: String, CodingKey {

        case id = "id"

        case title = "title"

        case fancyTitle = "fancy_title"

        case slug = "slug"

        case postsCount = "posts_count"

        case replyCount = "reply_count"

        case highestPostNumber = "highest_post_number"

        case imageURL = "image_url"

        case createdAt = "created_at"

        case lastPostedAt = "last_posted_at"

        case bumped = "bumped"

        case bumpedAt = "bumped_at"

        case unseen = "unseen"

        case lastReadPostNumber = "last_read_post_number"

        case unread = "unread"

        case newPosts = "new_posts"

        case pinned = "pinned"

        case unpinned = "unpinned"

        case visible = "visible"

        case closed = "closed"

        case archived = "archived"

        case notificationLevel = "notification_level"

        case bookmarked = "bookmarked"

        case liked = "liked"

        case archetype = "archetype"

        case likeCount = "like_count"

        case views = "views"

        case categoryID = "category_id"

        case posters = "posters"

    }

}



// MARK: - Poster

struct PosterSingleTopic: Codable {

    let extras: String?

    let posterDescription: String

    let user: CreatedBy



    enum CodingKeys: String, CodingKey {

        case extras = "extras"

        case posterDescription = "description"

        case user = "user"

    }

}
