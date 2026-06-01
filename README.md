# To-Do App

A modern Rails 8 application for managing tasks, items, and comments with a PWA (Progressive Web App) interface.

## Features

- **Task Management**: Create, view, and delete tasks with descriptions
- **Task Metadata**: Add priority levels and deadlines to tasks
- **Comments**: Add comments to tasks and manage them
- **Item Tracking**: Manage items with associated metadata
- **Progressive Web App**: Installable as a web app on mobile and desktop
- **Responsive Design**: Works seamlessly on desktop and mobile devices
- **Service Worker**: Offline-first capabilities with service worker
- **Docker Support**: Containerized deployment ready

## Tech Stack

- **Ruby**: 3.3.x
- **Rails**: 8.1.3
- **Database**: SQLite3 (development), PostgreSQL (production)
- **Web Server**: Puma
- **Frontend**: Hotwire (Turbo + Stimulus), Importmap
- **Container**: Docker & Docker Compose

## System Requirements

- Ruby 3.3.0+
- Node.js 18.0.0+ (for asset pipeline)
- SQLite3 (included by default)
- Git

## Installation

### Local Development Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/smurfac4/to_do_app.git
   cd to_do_app
   ```

2. **Install dependencies**:
   ```bash
   bundle install
   ```

3. **Setup the database**:
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Start the development server**:
   ```bash
   ./bin/dev
   ```

5. **Open in browser**:
   - Navigate to `http://localhost:3000`

### Docker Setup

1. **Build the Docker image**:
   ```bash
   docker build -t to_do_app .
   ```

2. **Run the container**:
   ```bash
   docker run -p 3000:3000 to_do_app
   ```

3. **Access the application**:
   - Open `http://localhost:3000`

## Project Structure

```
app/
├── controllers/          # Request handlers
│   ├── tasks_controller.rb
│   ├── items_controller.rb
│   └── comments_controller.rb
├── models/               # Data models
│   ├── task.rb
│   ├── item.rb
│   └── comment.rb
├── views/                # UI templates
│   ├── tasks/
│   ├── items/
│   ├── comments/
│   └── layouts/
├── services/             # Business logic
│   └── ai_service.rb
└── helpers/              # View helpers

config/
├── routes.rb             # URL routing
├── database.yml          # Database configuration
└── environments/         # Environment-specific configs

db/
├── migrate/              # Database migrations
└── schema.rb            # Database schema

public/
├── service-worker.js    # PWA service worker
└── manifest.json        # PWA manifest

test/                     # Test suite
├── controllers/
├── models/
└── fixtures/
```

## API Routes

### Tasks
- `GET /tasks` - List all tasks
- `GET /tasks/:id` - View a specific task
- `POST /tasks` - Create a new task
- `DELETE /tasks/:id` - Delete a task

### Comments (nested under Tasks)
- `POST /tasks/:task_id/comments` - Create a comment on a task
- `DELETE /tasks/:task_id/comments/:id` - Delete a comment

### Items
- `GET /items/index` - List all items

## Database Models

### Task
- `title` (string) - Task title (required)
- `description` (text) - Task description
- `priority` (integer) - Priority level (1-5)
- `deadline` (datetime) - Task deadline
- `created_at` (timestamp)
- `updated_at` (timestamp)

### Comment
- `content` (text) - Comment text
- `task_id` (foreign key) - Associated task
- `created_at` (timestamp)
- `updated_at` (timestamp)

### Item
- `name` (string) - Item name
- `description` (text) - Item description
- `created_at` (timestamp)
- `updated_at` (timestamp)

## Testing

Run the test suite:

```bash
rails test
```

Run specific test file:

```bash
rails test test/controllers/tasks_controller_test.rb
```

## Code Quality

Linting and security checks:

```bash
# RuboCop (code style)
rubocop

# Brakeman (security analysis)
brakeman

# Bundler Audit (dependency vulnerabilities)
bundler-audit
```

## Progressive Web App (PWA)

This application includes PWA capabilities:

1. **Manifest File**: Located at `public/manifest.json`
2. **Service Worker**: Located at `app/views/pwa/service-worker.js`
3. **Offline Support**: Service worker enables offline functionality
4. **Installable**: Can be installed on home screen on mobile and desktop

To install:
- Visit the app in your browser
- Look for the "Install" prompt (browser-dependent)
- Click "Install" to add to your home screen

## Development Workflow

### Running Commands

```bash
# Start development server with auto-reload
./bin/dev

# Open Rails console
rails console

# Run database migrations
rails db:migrate

# Create database backup
rails db:backup

# Rollback migrations
rails db:rollback
```

### Environment Variables

Create a `.env` file in the project root (not committed to git):

```
DATABASE_URL=sqlite3:db/development.sqlite3
RAILS_ENV=development
```

## Deployment

### Heroku Deployment

1. Install Heroku CLI and login
2. Create a new Heroku app
3. Deploy:
   ```bash
   git push heroku main
   ```

### Docker Deployment

Push to your container registry:

```bash
docker tag to_do_app your-registry/to_do_app:latest
docker push your-registry/to_do_app:latest
```

## Troubleshooting

### Port Already in Use
```bash
# Change port
rails s -p 3001
```

### Database Errors
```bash
# Reset database
rails db:drop db:create db:migrate
```

### Gem Installation Issues
```bash
# Clear bundler cache
bundle clean --force
bundle install
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the MIT License.

## Support

For issues and questions:
- Open an issue on GitHub: https://github.com/smurfac4/to_do_app/issues
- Check existing documentation and FAQs

## Changelog

### Version 1.0.0 (Initial Release)
- Task management system
- Comment functionality
- Item tracking
- PWA support
- Docker containerization
- CI/CD pipeline with GitHub Actions
