---
name: moodle-dev
description: Bộ kỹ năng toàn diện về lập trình Moodle, tích hợp quy trình kiểm soát bảo mật SCA và SAST cho hệ sinh thái Antygravity.
---
# Antygravity Skill: Moodle Development & Security Suite

## 1. Metadata
- **ID:** `antygravity-skill-moodle-devsec`
- **Name:** Moodle Development & Security Suite
- **Version:** 1.1.0
- **Category:** LMS / DevSecOps
- **Description:** Bộ kỹ năng toàn diện về lập trình Moodle, tích hợp quy trình kiểm soát bảo mật SCA và SAST cho hệ sinh thái Antygravity.

## 2. Core Technical Stack
- **Languages:** PHP 8.x+, JavaScript (ES6+), SQL.
- **Moodle Framework:** Core API, DML/DDL API, Output API (Mustache), Form API.
- **Frontend:** SCSS, AMD Modules, Grunt.
- **Infrastructure:** Moosh, Docker for Moodle, GitHub Actions/GitLab CI.

## 3. Implementation Specs (Components)
### 3.1. Plugin Architecture
- **Development:** Xây dựng plugin chuẩn (`local`, `mod`, `auth`, `enrol`, `block`).
- **Logic:** Xử lý Observer/Event, Ad-hoc tasks và Scheduled tasks.
- **API Integration:** Xây dựng các External Functions phục vụ Mobile App và hệ thống bên thứ ba qua REST.

### 3.2. SCA (Software Composition Analysis)
- **Dependency Audit:** Quản lý và kiểm tra lỗ hổng trong `vendor/` (Composer) và `node_modules/` (NPM).
- **Vulnerability Patching:** Nâng cấp hoặc thay thế các thư viện bên thứ ba bị dính mã CVE.
- **Compliance:** Đảm bảo giấy phép thư viện (MIT, GPL, Apache) tương thích với dự án.
- **Tools:** Snyk, GitHub Dependabot, OWASP Dependency-Check.

### 3.3. SAST (Static Application Security Testing)
- **Code Scan:** Phân tích mã nguồn tĩnh để phát hiện sớm các lỗi OWASP Top 10 (SQLi, XSS, CSRF).
- **Moodle Security Patterns:** 
    - Kiểm soát quyền hạn qua `require_capability()` và `has_capability()`.
    - Làm sạch dữ liệu vào/ra bằng `optional_param()`, `s()`, và `format_text()`.
- **Tools:** PHPStan (Moodle rules), SonarQube, Moodle Code Checker.

## 4. Security Fix Workflow
1. **Detection:** Quét mã nguồn tự động qua CI/CD pipeline.
2. **Analysis:** Phân loại lỗi từ SAST/SCA (False Positive vs. Real Threat).
3. **Remediation:** 
    - Code lại các đoạn mã không an toàn (SAST).
    - Cập nhật phiên bản thư viện an toàn (SCA).
4. **Verification:** Kiểm chứng lại bằng bộ unit test (PHPUnit) trước khi merge.

## 5. Deployment & Quality Standards
- **Coding Style:** Tuân thủ tuyệt đối [Moodle Coding Style](https://moodle.org).
- **Documentation:** Mọi hàm phải có PHPDoc đầy đủ và cập nhật `version.php`.
- **Environment:** Yêu cầu Moodle 5.1+, PHP 8.2+, PostgreSQL 16.

## 6. Security & Data Privacy
- **Privacy API:** Triển khai `provider.php` cho mọi plugin để tuân thủ GDPR.
- **Encryption:** Đảm bảo các dữ liệu nhạy cảm của người dùng Antygravity được mã hóa ở cấp độ DB.

---
*Last Updated: 2026-05-04*
*Author: Antygravity System Architect*
