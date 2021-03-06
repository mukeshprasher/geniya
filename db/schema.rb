# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140902064947) do

  create_table "activities", force: true do |t|
    t.integer  "user_id"
    t.string   "acted_upon_type"
    t.integer  "acted_upon_id"
    t.string   "action"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertisements", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact"
    t.string   "file_attachment_file_name"
    t.string   "file_attachment_content_type"
    t.integer  "file_attachment_file_size"
    t.datetime "file_attachment_updated_at"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "slogan"
    t.string   "description"
    t.string   "link"
    t.integer  "category_id"
  end

  create_table "affiliations", force: true do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.integer  "sub_category_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "albums", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.string   "kind"
    t.string   "slug"
    t.integer  "impressions_count",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "comment_count",      default: "0"
    t.string   "like_count",         default: "0"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "pin_id"
    t.integer  "sub_category_id"
  end

  add_index "albums", ["category_id"], name: "index_albums_on_category_id"
  add_index "albums", ["slug"], name: "index_albums_on_slug", unique: true

  create_table "bussinesses", force: true do |t|
    t.integer  "user_id"
    t.text     "summary"
    t.text     "agenda"
    t.text     "services"
    t.text     "about"
    t.text     "industry"
    t.text     "website"
    t.text     "contact"
    t.text     "headquarter"
    t.text     "companysize"
    t.text     "founded"
    t.string   "file_attachment_file_name"
    t.string   "file_attachment_content_type"
    t.integer  "file_attachment_file_size"
    t.datetime "file_attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "youtube_link"
    t.string   "google_link"
    t.text     "tagline"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true

  create_table "chats", force: true do |t|
    t.integer  "user_id"
    t.integer  "reciever_id"
    t.text     "message"
    t.string   "status",      default: "unread"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "commentable_id",   default: 0
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          default: 0, null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "connections", force: true do |t|
    t.integer  "user_id"
    t.integer  "connection_id"
    t.string   "status"
    t.datetime "accepted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "notification_status", default: 0
  end

  create_table "conversations", force: true do |t|
    t.string   "subject",      default: ""
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "sender_id"
    t.integer  "recipient_id"
  end

  add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id"
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "region"
    t.integer  "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "covers", force: true do |t|
    t.string   "upload_type"
    t.integer  "album_id"
    t.integer  "update_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.string   "file_attachment_file_name"
    t.string   "file_attachment_content_type"
    t.integer  "file_attachment_file_size"
    t.datetime "file_attachment_updated_at"
    t.string   "file_type"
    t.string   "extension"
    t.string   "special_attribute"
    t.string   "file_attachment_fingerprint"
    t.integer  "impressions_count",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "development_logs", force: true do |t|
    t.integer  "user_id"
    t.string   "kind"
    t.string   "title"
    t.text     "description"
    t.string   "file_attachment_file_name"
    t.string   "file_attachment_content_type"
    t.integer  "file_attachment_file_size"
    t.datetime "file_attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: true do |t|
    t.string   "institute_name"
    t.string   "course_name"
    t.integer  "start_date"
    t.integer  "end_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "privacy",     default: "connections"
    t.text     "location"
  end

  create_table "featureimgs", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "feature_img_file_name"
    t.string   "feature_img_content_type"
    t.integer  "feature_img_file_size"
    t.datetime "feature_img_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedback_replies", force: true do |t|
    t.integer  "parent_id"
    t.integer  "user_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feedback_id"
  end

  create_table "feedbacks", force: true do |t|
    t.integer  "parent_id"
    t.integer  "user_id"
    t.string   "email"
    t.string   "kind"
    t.string   "subject"
    t.text     "description"
    t.string   "priority"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "job_skills", force: true do |t|
    t.integer  "job_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.string   "reference_code"
    t.string   "title"
    t.text     "description"
    t.decimal  "minimum_experience"
    t.decimal  "maximum_experience"
    t.integer  "minimum_salary"
    t.integer  "maximum_salary"
    t.string   "employment_type"
    t.string   "employment_status"
    t.string   "currency"
    t.text     "skills_text"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "impressions_count",  default: 0
  end

  create_table "likes", force: true do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables"
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes"

  create_table "locations", force: true do |t|
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "pin_id"
    t.string   "street_address"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.string   "new_country"
    t.string   "new_state"
    t.string   "new_city"
    t.string   "new_pin"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mentions", force: true do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables"
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions"

  create_table "menucategories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menuitems", force: true do |t|
    t.integer  "user_id"
    t.integer  "menucategory_id"
    t.string   "name"
    t.string   "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",          default: "unread"
    t.integer  "recipient_id"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["recipient_id"], name: "index_messages_on_recipient_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "multiuploads", force: true do |t|
    t.string   "multiupload_file_title"
    t.string   "multiupload_file_desc"
    t.integer  "album_id"
    t.integer  "user_id"
    t.string   "multiupload_file_name"
    t.string   "multiupload_content_type"
    t.integer  "multiupload_file_size"
    t.datetime "multiupload_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], name: "index_notifications_on_conversation_id"

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.date     "start_date"
    t.integer  "address_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_subscriptions", force: true do |t|
    t.integer  "user_id"
    t.string   "subscr_id"
    t.string   "custom"
    t.string   "txn_type"
    t.string   "subscr_date"
    t.string   "period3"
    t.string   "item_name"
    t.string   "item_number"
    t.string   "amount3"
    t.string   "mc_amount3"
    t.string   "mc_currency"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_name"
    t.string   "address_status"
    t.string   "address_street"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip"
    t.string   "address_country"
    t.string   "address_country_code"
    t.string   "residence_country"
    t.string   "status"
    t.string   "shipment_sent"
    t.string   "invoice"
    t.string   "business"
    t.string   "recurring"
    t.string   "verify_sign"
    t.string   "payer_status"
    t.string   "test_ipn"
    t.string   "payer_email"
    t.string   "receiver_email"
    t.string   "payer_id"
    t.string   "reattempt"
    t.string   "charset"
    t.string   "notify_version"
    t.string   "ipn_track_id"
    t.string   "transaction_subject"
    t.string   "payment_date"
    t.string   "payment_gross"
    t.string   "payment_type"
    t.string   "protection_eligibility"
    t.string   "txn_id"
    t.string   "receiver_id"
    t.string   "payment_status"
    t.string   "payment_fee"
    t.string   "mc_fee"
    t.string   "mc_gross"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "payment_subscription_id"
    t.integer  "user_id"
    t.string   "txn_id"
    t.string   "subscr_id"
    t.string   "item_name"
    t.string   "transaction_subject"
    t.string   "item_number"
    t.string   "receiver_email"
    t.string   "payer_email"
    t.string   "business"
    t.string   "payer_id"
    t.string   "receiver_id"
    t.string   "payment_date"
    t.string   "payment_status"
    t.decimal  "mc_gross"
    t.decimal  "payment_gross"
    t.decimal  "mc_fee"
    t.decimal  "payment_fee"
    t.string   "mc_currency"
    t.string   "protection_eligibility"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_name"
    t.string   "address_street"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip"
    t.string   "address_country_code"
    t.string   "address_country"
    t.string   "residence_country"
    t.string   "address_status"
    t.string   "payment_type"
    t.string   "txn_type"
    t.string   "payer_status"
    t.string   "verify_sign"
    t.string   "ipn_track_id"
    t.string   "test_ipn"
    t.string   "charset"
    t.string   "notify_version"
    t.string   "custom"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pins", force: true do |t|
    t.string   "code"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  create_table "quotes", force: true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.integer  "sender_id"
    t.string   "name"
    t.string   "email"
    t.string   "contact"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id"

  create_table "rating_caches", force: true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "receipts", ["notification_id"], name: "index_receipts_on_notification_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "responses", force: true do |t|
    t.integer  "user_id"
    t.string   "acted_upon_type"
    t.integer  "acted_upon_id"
    t.string   "act"
    t.integer  "actor_id"
    t.text     "description"
    t.integer  "status",          default: 0
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shares", force: true do |t|
    t.integer  "user_id"
    t.string   "shared_type"
    t.integer  "shared_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_categories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "sub_category_group_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id"
  add_index "sub_categories", ["name"], name: "index_sub_categories_on_name"
  add_index "sub_categories", ["slug"], name: "index_sub_categories_on_slug", unique: true

  create_table "sub_category_groups", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "user_id"
    t.string   "status"
    t.string   "random_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", force: true do |t|
    t.text     "text"
    t.string   "privacy",          default: "public"
    t.integer  "sender_user_id"
    t.integer  "receiver_user_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updates", ["created_at"], name: "index_updates_on_created_at"
  add_index "updates", ["receiver_user_id"], name: "index_updates_on_receiver_user_id"
  add_index "updates", ["sender_user_id"], name: "index_updates_on_sender_user_id"

  create_table "uploads", force: true do |t|
    t.string   "upload_type"
    t.integer  "album_id"
    t.integer  "update_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.string   "file_attachment_file_name"
    t.string   "file_attachment_content_type"
    t.integer  "file_attachment_file_size"
    t.datetime "file_attachment_updated_at"
    t.string   "file_type"
    t.string   "extension"
    t.string   "special_attribute"
    t.string   "file_attachment_fingerprint"
    t.integer  "impressions_count",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_menucategories", force: true do |t|
    t.integer  "user_id"
    t.integer  "menucategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_skills", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sub_categories", force: true do |t|
    t.integer  "user_id"
    t.integer  "sub_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_tags", force: true do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "name"
    t.string   "gender"
    t.text     "summary"
    t.integer  "height"
    t.integer  "bust"
    t.integer  "hips"
    t.integer  "shoes"
    t.string   "hair"
    t.string   "eyes"
    t.date     "birthdate"
    t.string   "available"
    t.string   "plan"
    t.datetime "plan_end"
    t.string   "status"
    t.string   "tag"
    t.string   "slug"
    t.integer  "impressions_count",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "feature_img"
    t.string   "change_password_code"
    t.string   "chosen_plan"
    t.string   "kind",                 default: "user"
    t.integer  "parent_id",            default: 0
    t.string   "login_status"
    t.datetime "last_seen"
    t.string   "height_stats"
    t.string   "weight_stats"
    t.string   "bust_stats"
    t.string   "waist_stats"
    t.string   "hips_stats"
    t.string   "shoe_stats"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "userskills", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usertags", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "name"
    t.integer  "update_id"
    t.string   "file_attachment_file_name"
    t.string   "file_attachment_content_type"
    t.integer  "file_attachment_file_size"
    t.datetime "file_attachment_updated_at"
    t.integer  "user_id"
    t.string   "slug"
    t.integer  "impressions_count",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "album_id"
  end

end
