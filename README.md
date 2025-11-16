#  <span style="color:#6C63FF">Social Platform ERD Documentation</span>

This document describes the database structure (Entity Relationship Diagram) for a social platform that includes users, posts, comments, professional experience, projects, and chat messages.

---

## 👤 <span style="color:#FF6B6B">1. User Entity</span>

**Table Name:** `users`

### **Attributes:**

* **username** – Unique username for each user
* **title** – Job title or short headline
* **address** – User’s physical address
* **profile_image** – Path/URL to profile image
* **cover_image** – Path/URL to cover image
* **connections** – Number of connections / linked users
* **about** – Short bio or description
* **languages** – List of languages spoken by user
* **verification_status** – Boolean or enum (verified / not verified)
* **email_address** – User’s email
* **password** – Encrypted password
* **role** – Enum: `employee`, `employer`
* **last_active_date** – Date/time of last activity

### **Relationships:**

* One-to-Many: User → Posts
* One-to-Many: User → Comments
* One-to-Many: User → Experience
* One-to-Many: User → Projects
* Many-to-Many: User ↔ Chat

---

## 📝 <span style="color:#4ECDC4">2. Post Entity</span>

**Table Name:** `posts`

### **Attributes:**

* **user_id** – References `users.id`
* **content** – Text content of the post
* **files (post_files)** – Images, videos, attachments
* **comments** – Total comment count
* **reaction** – Likes or reaction count
* **date** – Post creation date
* **modified_status** – Boolean: edited or not

### **Relationships:**

* Many-to-One: Post → User
* One-to-Many: Post → Comments

---

## 💬 <span style="color:#FFA726">3. Comments Entity</span>

**Table Name:** `comments`

### **Attributes:**

* **user_id** – References `users.id`
* **body** – Comment text
* **reaction** – Enum reaction type (like, love, laugh, etc.)
* **date** – Comment date
* **modified_status** – Boolean: edited or not

### **Relationships:**

* Many-to-One: Comments → User
* Many-to-One: Comments → Post

---

## 💼 <span style="color:#42A5F5">4. Experience Entity</span>

**Table Name:** `experience`

### **Attributes:**

* **image** – Company or role image
* **title** – Job title
* **sub_title** – Company or position subtitle
* **start_date** – Starting date
* **end_date** – Ending date (nullable)
* **address** – Location of work
* **skills_id** – References skills (nullable)
* **location_type** – Remote / On-site / Hybrid
* **description** – Job description
* **files (experience_files)** – Related attachments (nullable)

### **Relationships:**

* Many-to-One: Experience → User
* Optional Many-to-Many: Experience ↔ Skills

---

## 🛠️ <span style="color:#AB47BC">5. Projects Entity</span>

**Table Name:** `projects`

### **Attributes:**

* **project_name** – Name of the project
* **provider** – Client, school, or company providing the project
* **description** – Project description
* **skills** – List of skills used
* **files (project_files)** – Attachments and media
* **date** – Project completion or publish date

### **Relationships:**

* Many-to-One: Project → User

---

## 💭 <span style="color:#26C6DA">6. Chat Entity</span>

**Table Name:** `chats`

### **Attributes:**

* **chat_id** – Unique ID for the chat
* **message** – Chat message
* **date** – Timestamp of message
* **modify_state** – Message edited or not
* **user_id** – Sender ID (Many-to-Many through pivot)

### **Relationships:**

* Many-to-Many: Users ↔ Chats (a chat room can have multiple users)
* Many-to-One: Chat Message → User (sender)

---

## 🗂️ <span style="color:#8D6E63">ERD Overview Summary</span>

* **Users** create **posts**, write **comments**, add **experience**, work on **projects**, and participate in **chats**.
* **Posts** and **comments** support media files.
* **Experiences** and **projects** include optional files and skill associations.
* **Chat system** supports group and private messaging using many-to-many user relationships.

---

If you want, I can also generate the ERD diagram image or turn this into a more styled README with badges and sections.

