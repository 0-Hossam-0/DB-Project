#  <span style="color:#6C63FF">Social Platform ERD Documentatio</span>


---

# 👤 <span style="color:#FF6B6B">1. Users</span>

**Table Name:** `users`

### **Attributes:**

* **id** *(PK, integer)*
* **username** *(string)*
* **title** *(string)*
* **address** *(string)*
* **profile_image** *(string/URL)*
* **cover_image** *(string/URL)*
* **about** *(text)*
* **languages** *(JSON array)*
* **verification_status** *(enum)*
* **email_address** *(string)*
* **password** *(string hashed)*
* **role** *(enum: employee, employer)*
* **last_active_date** *(datetime)*

### **Relationships:**

* One-to-Many → Posts
* One-to-Many → Comments
* Many-to-Many → Connections (via `user_connections`)
* One-to-Many → Experience
* One-to-Many → Projects
* Many-to-Many → Chat Members
* Many-to-Many → Company Followers

---

# 🔗 <span style="color:#FF8A65">1A. User Connections</span>

**Table Name:** `user_connections`

### **Attributes:**

* **user_id** *(FK → users.id)*
* **connection_id** *(FK → users.id)*

---

# 📝 <span style="color:#4ECDC4">2. Posts</span>

**Table Name:** `user_posts`

### **Attributes:**

* **id** *(PK)*
* **user_id** *(FK)*
* **content** *(text)*
* **files** *(JSON array)*
* **comments_count** *(integer)*
* **reaction_count** *(integer)*
* **date** *(datetime)*
* **modified_status** *(boolean)*

### **Relationships:**

* One-to-Many → Post Comments
* One-to-Many → Post Reactions

---

# 💬 <span style="color:#FFA726">3. Post Comments</span>

**Table Name:** `post_comments`

### **Attributes:**

* **id** *(PK)*
* **post_id** *(FK)*
* **user_id** *(FK)*
* **body** *(text)*
* **reaction** *(enum)*
* **date** *(datetime)*
* **modified_status** *(boolean)*

---

# ❤️ <span style="color:#FF5252">3A. Post Reactions</span>

**Table Name:** `post_reactions`

### **Attributes:**

* **id** *(PK)*
* **post_id** *(FK)*
* **user_id** *(FK)*
* **reaction_type** *(enum)*

---

# 💼 <span style="color:#42A5F5">4. Experience</span>

**Table Name:** `experience`

### **Attributes:**

* **id** *(PK)*
* **user_id** *(FK)*
* **image** *(string)*
* **title** *(string)*
* **sub_title** *(string)*
* **start_date** *(date)*
* **end_date** *(date nullable)*
* **address** *(string)*
* **location_type** *(enum)*
* **description** *(text)*
* **files** *(JSON nullable)*

---

# 🧩 <span style="color:#7E57C2">4A. Experience Skills</span>

**Table Name:** `experience_skills`

### **Attributes:**

* **experience_id** *(FK)*
* **skill_id** *(FK)*

---

# 🛠️ <span style="color:#AB47BC">5. Projects</span>

**Table Name:** `projects`

### **Attributes:**

* **id** *(PK)*
* **user_id** *(FK)*
* **project_name** *(string)*
* **provider** *(string)*
* **description** *(text)*
* **skills** *(JSON array)*
* **files** *(JSON array)*
* **date** *(datetime)*

---

# 💭 <span style="color:#26C6DA">6. Chat System</span>

## **6.1 Chats (Rooms)**

**Table Name:** `chats`

* **id** *(PK)*
* **created_at** *(datetime)*

## **6.2 Chat Members (Many-to-Many)**

**Table Name:** `chat_members`

* **chat_id** *(FK)*
* **user_id** *(FK)*

## **6.3 Chat Messages**

**Table Name:** `chat_messages`

* **id** *(PK)*
* **chat_id** *(FK)*
* **sender_id** *(FK → users.id)*
* **message** *(text)*
* **date** *(datetime)*
* **modify_state** *(boolean)*

---

# 🏢 <span style="color:#FF7043">7. Company</span>

**Table Name:** `companies`

### **Attributes:**

* **id** *(PK)*
* **profile_image** *(string)*
* **cover_image** *(string)*
* **about** *(text)*

---

# 🧑‍💼 <span style="color:#EC407A">7A. Company Employees</span>

**Table Name:** `company_employees`

* **company_id** *(FK)*
* **user_id** *(FK)*

---

# ⭐ <span style="color:#26A69A">7B. Company Followers</span>

**Table Name:** `company_followers`

* **company_id** *(FK)*
* **user_id** *(FK)*

---

# 📢 <span style="color:#7E57C2">8. Company Posts</span>

**Table Name:** `company_posts`

### **Attributes:**

* **id** *(PK)*
* **company_id** *(FK)*
* **content** *(text)*
* **files** *(JSON array)*
* **comments_count** *(integer)*
* **reaction_count** *(integer)*
* **date** *(datetime)*
* **modified_status** *(boolean)*

---

# 🏛️ <span style="color:#29B6F6">9. Jobs</span>

**Table Name:** `jobs`

### **Attributes:**

* **id** *(PK)*
* **company_id** *(FK)*
* **title** *(string)*
* **location_type** *(enum: on_site, hybrid, remote)*
* **date** *(datetime)*
* **about** *(text)*
* **work_status** *(enum: fullTime, partTime)*

---

# 📝 <span style="color:#8BC34A">9A. Job Applicants</span>

**Table Name:** `job_applicants`

* **job_id** *(FK)*
* **user_id** *(FK)*

---

# 🗂️ <span style="color:#8D6E63">ERD Overview Summary</span>

* Fully normalized LinkedIn‑style schema
* All relationships properly represented
* No duplicated or denormalized fields
* Supports scalable search, messaging, professional graphs, jobs & companies

---
