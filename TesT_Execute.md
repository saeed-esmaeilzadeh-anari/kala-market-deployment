# 🧪 راهنمای کامل تست و اجرا - کالا مارکت 

## 📑 فهرست مطالب 

1. [پیش‌نیازها](#پیش-نیازها) 

2. [راه‌اندازی Backend](#راه-اندازی-backend) 

3. [راه‌اندازی Frontend](#راه-اندازی-frontend) 

4. [تست‌های مرحله به مرحله](#تست-های-مرحله-به-مرحله) 

5. [نکات حرفه‌ای برای مصاحبه](#نکات-حرفه‌ای-برای-مصاحبه) 

6. [رفع مشکلات رایج](#رفع-مشکلات-رایج) 

--- 

## 🔧 پیش‌نیازها 

### نصب ابزارهای مورد نیاز: 

\`\`\`bash 

# نصب Node.js (نسخه 18 یا بالاتر) 

node --version  # باید 18.x یا بالاتر باشد 

npm --version   # باید 9.x یا بالاتر باشد 

 
 

# نصب PostgreSQL (نسخه 14 یا بالاتر) 

postgres --version  # باید 14.x یا بالاتر باشد 

 
 

# نصب Redis (برای caching) 

redis-cli --version 

\`\`\` 

 
 

--- 

 
 

## 🚀 مرحله 1: راه‌اندازی Database 

 
 

### 1.1 ایجاد Database 

 
 

\`\`\`sql 

-- اتصال به PostgreSQL 

psql -U postgres 

 
 

-- ایجاد database 

CREATE DATABASE kala_market; 

 
 

-- ایجاد user 

CREATE USER kala_user WITH PASSWORD 'your_secure_password'; 

 
 

-- دادن دسترسی 

GRANT ALL PRIVILEGES ON DATABASE kala_market TO kala_user; 

 
 

-- خروج 

\q 

\`\`\` 

 
 

### 1.2 راه‌اندازی Redis 

 
 

\`\`\`bash 

# اجرای Redis 

redis-server 

 
 

# در ترمینال دیگر، تست اتصال 

redis-cli ping 

# باید PONG برگرداند 

\`\`\` 

 
 

--- 

 
 

## 🎯 مرحله 2: راه‌اندازی Backend 

 
 

### 2.1 نصب وابستگی‌ها 

 
 

\`\`\`bash 

cd backend 

npm install 

\`\`\` 

 
 

**⚠️ نکته مهم:** اگر خطای نصب داشتید: 

\`\`\`bash 

npm install --legacy-peer-deps 

\`\`\` 

 
 

### 2.2 پیکربندی Environment Variables 

 
 

\`\`\`bash 

cp .env.example .env 

\`\`\` 

 
 

ویرایش فایل `.env`: 

 
 

\`\`\`env 

# Database 

DATABASE_URL="postgresql://kala_user:your_secure_password@localhost:5432/kala_market?schema=public" 

 
 

# JWT 

JWT_SECRET="your-super-secret-jwt-key-change-this-in-production" 

JWT_REFRESH_SECRET="your-super-secret-refresh-key-change-this-in-production" 

JWT_EXPIRES_IN="15m" 

JWT_REFRESH_EXPIRES_IN="7d" 

 
 

# Redis 

REDIS_HOST="localhost" 

REDIS_PORT=6379 

REDIS_PASSWORD="" 

 
 

# App 

NODE_ENV="development" 

PORT=3001 

FRONTEND_URL="http://localhost:3000" 

 
 

# CORS 

CORS_ORIGIN="http://localhost:3000" 

 
 

# Rate Limiting 

RATE_LIMIT_TTL=60000 

RATE_LIMIT_MAX=100 

 
 

# Upload (Cloudinary) 

CLOUDINARY_CLOUD_NAME="" 

CLOUDINARY_API_KEY="" 

CLOUDINARY_API_SECRET="" 

\`\`\` 

 
 

### 2.3 اجرای Migrations و Seed 

 
 

\`\`\`bash 

# تولید Prisma Client 

npm run prisma:generate 

 
 

# اجرای migrations 

npm run prisma:migrate 

 
 

# بارگذاری داده‌های اولیه 

npm run prisma:seed 

\`\`\` 

 
 

**✅ چک کنید:** باید پیغام موفقیت ببینید: 

\`\`\` 

✅ Database seeded successfully! 

📧 Admin Email: admin@kalamarket.com 

🔐 Password: Admin@123456 

\`\`\` 

 
 

### 2.4 اجرای Backend 

 
 

\`\`\`bash 

npm run start:dev 

\`\`\` 

 
 

**✅ چک کنید:** باید پیام‌های زیر را ببینید: 

\`\`\` 

🚀 Application is running on: http://localhost:3001 

📚 API Documentation: http://localhost:3001/api/docs 

🔥 Environment: development 

\`\`\` 

### 2.5 تست Backend با Swagger 

1. مرورگر را باز کنید: `http://localhost:3001/api/docs` 

2. باید داکیومنتیشن Swagger را ببینید 

3. تست endpoint ها: 

\`\`\`bash 

# تست Health Check 

curl http://localhost:3001/api/v1/health 

# تست Login 

curl -X POST http://localhost:3001/api/v1/auth/login \ 

  -H "Content-Type: application/json" \ 

  -d '{ 

    "email": "admin@kalamarket.com", 

    "password": "Admin@123456" 

  }' 

\`\`\` 

 
 

--- 

 
 

## 🎨 مرحله 3: راه‌اندازی Frontend 

 
 

### 3.1 نصب وابستگی‌ها 

 
 

\`\`\`bash 

cd frontend 

npm install 

\`\`\` 

 
 

### 3.2 پیکربندی Environment Variables 

 
 

\`\`\`bash 

cp .env.example .env.local 

\`\`\` 

 
 

ویرایش فایل `.env.local`: 

\`\`\`env 

NEXT_PUBLIC_API_URL=http://localhost:3001/api/v1 

NEXT_PUBLIC_SITE_URL=http://localhost:3000 

\`\`\` 

### 3.3 اجرای Frontend 

\`\`\`bash 

npm run dev 

\`\`\` 

 
 

**✅ چک کنید:** 

\`\`\` 

  ▲ Next.js 14.x.x 

  - Local:        http://localhost:3000 

  - ready started server on 0.0.0.0:3000 

\`\`\` 

 
 

### 3.4 تست Frontend 

1. باز کردن: `http://localhost:3000` 

2. باید صفحه اصلی را ببینید 

3. تست لاگین: `http://localhost:3000/auth/login` 

--- 

 
 

## 🧪 مرحله 4: تست‌های جامع 

 
 

### 4.1 تست Authentication (⭐️ مهم برای مصاحبه) 

 
 

\`\`\`bash 

# 1. ثبت‌نام کاربر جدید 

curl -X POST http://localhost:3001/api/v1/auth/register \ 

  -H "Content-Type: application/json" \ 

  -d '{ 

    "email": "test@example.com", 

    "password": "Test@123456", 

    "firstName": "تست", 

    "lastName": "کاربر", 

    "phone": "+989123456789" 

  }' 

 
 

# 2. لاگین 

curl -X POST http://localhost:3001/api/v1/auth/login \ 

  -H "Content-Type: application/json" \ 

  -d '{ 

    "email": "admin@kalamarket.com", 

    "password": "Admin@123456" 

  }' 

 
 

# ذخیره TOKEN از response 

export TOKEN="your-access-token-here" 

# 3. دریافت پروفایل با توکن 

curl -X GET http://localhost:3001/api/v1/users/profile \ 

  -H "Authorization: Bearer $TOKEN" 

\`\`\` 

### 4.2 تست Products API (⭐️ مهم برای مصاحبه) 

\`\`\`bash 

# 1. لیست محصولات 

curl http://localhost:3001/api/v1/products 

# 2. لیست محصولات با فیلتر 

curl "http://localhost:3001/api/v1/products?page=1&limit=10&categoryId=cat-mobile-phones" 

# 3. جزئیات محصول 

curl http://localhost:3001/api/v1/products/samsung-galaxy-s23-ultra 

# 4. محصولات پیشنهادی 

curl http://localhost:3001/api/v1/products/featured 

# 5. ایجاد محصول جدید (نیاز به توکن ادمین) 

curl -X POST http://localhost:3001/api/v1/products \ 

  -H "Authorization: Bearer $TOKEN" \ 

  -H "Content-Type: application/json" \ 

  -d '{ 

    "name": "محصول تست", 

    "slug": "test-product", 

    "description": "توضیحات محصول تست", 

    "sku": "TEST-001", 

    "price": 1000000, 

    "quantity": 10, 

    "categoryId": "cat-mobile-phones", 

    "brandId": "brand-samsung" 

  }' 

\`\`\` 

 
 

### 4.3 تست Cart System (⭐️ مهم برای مصاحبه) 

 
 

\`\`\`bash 

# 1. مشاهده سبد خرید 

curl -X GET http://localhost:3001/api/v1/cart \ 

  -H "Authorization: Bearer $TOKEN" 

 
 

# 2. افزودن به سبد 

curl -X POST http://localhost:3001/api/v1/cart/items \ 

  -H "Authorization: Bearer $TOKEN" \ 

  -H "Content-Type: application/json" \ 

  -d '{ 

    "productId": "prod-samsung-s23", 

    "quantity": 1 

  }' 

# 3. بروزرسانی تعداد 

curl -X PATCH http://localhost:3001/api/v1/cart/items/{itemId} \ 

  -H "Authorization: Bearer $TOKEN" \ 

  -H "Content-Type: application/json" \ 

  -d '{ 

    "quantity": 2 

  }' 

 
 

# 4. حذف از سبد 

curl -X DELETE http://localhost:3001/api/v1/cart/items/{itemId} \ 

  -H "Authorization: Bearer $TOKEN" 

\`\`\` 

### 4.4 تست Order System (⭐️⭐️ خیلی مهم برای مصاحبه) 

\`\`\`bash 

# 1. ایجاد سفارش 

curl -X POST http://localhost:3001/api/v1/orders \ 

  -H "Authorization: Bearer $TOKEN" \ 

  -H "Content-Type: application/json" \ 

  -d '{ 

    "shippingAddressId": "addr-1", 

    "paymentMethod": "CREDIT_CARD" 

  }' 

# 2. لیست سفارشات 

curl -X GET http://localhost:3001/api/v1/orders \ 

  -H "Authorization: Bearer $TOKEN" 

# 3. جزئیات سفارش 

curl -X GET http://localhost:3001/api/v1/orders/{orderId} \ 

  -H "Authorization: Bearer $TOKEN" 

# 4. بروزرسانی وضعیت سفارش (فقط ادمین) 

curl -X PATCH http://localhost:3001/api/v1/orders/{orderId}/status \ 

  -H "Authorization: Bearer $ADMIN_TOKEN" \ 

  -H "Content-Type: application/json" \ 

  -d '{ 

    "status": "CONFIRMED" 

  }' 

\`\`\` 

### 4.5 تست Search & Filter (⭐️⭐️ خیلی مهم برای مصاحبه) 

\`\`\`bash 

# 1. جست‌وجوی ساده 

curl "http://localhost:3001/api/v1/search/products?q=samsung" 

 
 

# 2. جست‌وجو با فیلتر 

curl "http://localhost:3001/api/v1/search/products?q=گوشی&minPrice=10000000&maxPrice=60000000&categoryId=cat-mobile-phones" 

 
 

# 3. پیشنهادات جست‌وجو 

curl "http://localhost:3001/api/v1/search/suggestions?q=sam" 

 
 

# 4. مرتب‌سازی 

curl "http://localhost:3001/api/v1/products?sortBy=price&sortOrder=desc" 

\`\`\` 

 
 

### 4.6 تست Cache System (⭐️⭐️ خیلی مهم برای مصاحبه) 

 
 

\`\`\`bash 

# 1. اولین درخواست (از database) 

time curl http://localhost:3001/api/v1/products 

 
 

# 2. درخواست دوم (از cache) - باید سریع‌تر باشد 

time curl http://localhost:3001/api/v1/products 

 
 

# 3. بررسی Redis 

redis-cli 

> KEYS * 

> GET "products:page:1:limit:10" 

> TTL "products:page:1:limit:10" 

> exit 

\`\`\` 

 
 

--- 

 
 

## 🎓 مرحله 5: نکات حرفه‌ای برای مصاحبه 

 
 

### 5.1 معماری (⭐️⭐️⭐️ بسیار مهم) 

 
 

**سوالات احتمالی:** 

 
 

**Q: چرا Clean Architecture استفاده کردید؟** 

 
 

A: "Clean Architecture به ما اجازه می‌دهد: 

1. **جداسازی مسئولیت‌ها**: Domain logic از infrastructure جدا است 

2. **تست‌پذیری**: می‌توانیم هر لایه را جداگانه تست کنیم 

3. **مقیاس‌پذیری**: آسان می‌توانیم features جدید اضافه کنیم 

4. **نگهداری آسان**: تغییر در یک لایه، لایه‌های دیگر را تحت تاثیر قرار نمی‌دهد" 

 
 

**مثال عملی:** 

\`\`\`typescript 

// ❌ بد: همه چیز در یک فایل 

async createOrder(data) { 

  const user = await prisma.user.findUnique() 

  const payment = await stripe.charge() 

  const order = await prisma.order.create() 

  await sendEmail() 

  return order 

} 

 
 

// ✅ خوب: Clean Architecture 

// Domain Layer 

class Order { 

  constructor(private readonly items: OrderItem[]) {} 

  calculateTotal(): number { ... } 

  validate(): void { ... } 

} 

 
 

// Application Layer 

class CreateOrderUseCase { 

  async execute(dto: CreateOrderDto): Promise<Order> { 

    const order = this.orderFactory.create(dto) 

    order.validate() 

    return await this.orderRepository.save(order) 

  } 

} 

 
 

// Infrastructure Layer 

class PrismaOrderRepository implements IOrderRepository { 

  async save(order: Order): Promise<Order> { 

    return await this.prisma.order.create(...) 

  } 

} 

\`\`\` 

 
 

### 5.2 Database Design (⭐️⭐️⭐️ بسیار مهم) 

 
 

**Q: چرا Prisma استفاده کردید؟** 

 
 

A: "Prisma مزایای زیر را دارد: 

1. **Type Safety**: کامل TypeScript support 

2. **Migrations**: مدیریت آسان schema changes 

3. **Query Builder**: کوئری‌های پیچیده به صورت type-safe 

4. **Performance**: Optimized queries و connection pooling" 

 
 

**مثال نشان دادن:** 

\`\`\`typescript 

// Type-safe queries 

const products = await prisma.product.findMany({ 

  where: { 

    categoryId: 'cat-mobile', 

    price: { gte: 10000000, lte: 50000000 } 

  }, 

  include: { 

    category: true, 

    brand: true, 

    images: true 

  }, 

  orderBy: { price: 'desc' }, 

  take: 10 

}) 

// TypeScript می‌داند products چه شکلی است! 

\`\`\` 

 
 

### 5.3 Caching Strategy (⭐️⭐️⭐️ بسیار مهم) 

 
 

**Q: استراتژی Caching شما چیست؟** 

 
 

A: "از Redis با TTL-based caching استفاده می‌کنیم: 

1. **Product Lists**: 5 دقیقه cache 

2. **Product Details**: 10 دقیقه cache 

3. **Categories**: 1 ساعت cache 

4. **Search Results**: 5 دقیقه cache" 

 
 

**نمایش عملی:** 

\`\`\`typescript 

@UseInterceptors(CacheInterceptor) 

@CacheTTL(300) // 5 minutes 

async getProducts() { 

  return await this.productsService.findAll() 

} 

 
 

// Invalidation 

async updateProduct(id: string) { 

  await this.redisService.del(`product:${id}`) 

  await this.redisService.del('products:*') 

} 

\`\`\` 

 
 

### 5.4 Security (⭐️⭐️⭐️ بسیار مهم) 

 
 

**Q: امنیت API را چگونه پیاده کرده‌اید؟** 

 
 

A: "چند لایه امنیتی داریم: 

1. **Authentication**: JWT با refresh tokens 

2. **Authorization**: Role-based access control (RBAC) 

3. **Rate Limiting**: جلوگیری از abuse 

4. **Input Validation**: با class-validator 

5. **SQL Injection Prevention**: با Prisma ORM 

6. **XSS Prevention**: با helmet 

7. **CORS**: محدود به frontend domain" 

 
 

**نمایش کد:** 

\`\`\`typescript 

// Rate Limiting 

@Throttle(10, 60) // 10 requests per minute 

@Post('login') 

async login() { ... } 

 
 

// Role-based Access 

@UseGuards(JwtAuthGuard, RolesGuard) 

@Roles('ADMIN', 'SUPER_ADMIN') 

@Delete('products/:id') 

async deleteProduct() { ... } 

 
 

// Input Validation 

class CreateProductDto { 

  @IsString() 

  @MinLength(3) 

  @MaxLength(200) 

  name: string 

 
 

  @IsNumber() 

  @Min(0) 

  @Max(1000000000) 

  price: number 

} 

\`\`\` 

 
 

### 5.5 Performance Optimization (⭐️⭐️ مهم) 

 
 

**Q: چگونه Performance را بهینه کرده‌اید؟** 

 
 

A: "چند تکنیک: 

1. **Database Indexing**: بر روی فیلدهای پرجست‌وجو 

2. **Lazy Loading**: فقط data مورد نیاز را load می‌کنیم 

3. **Pagination**: برای لیست‌های بزرگ 

4. **Image Optimization**: با Sharp و Cloudinary 

5. **Response Compression**: با compression middleware 

6. **Redis Caching**: برای کاهش database queries" 

 
 

**نمایش تفاوت:** 

\`\`\`typescript 

// ❌ بد: N+1 Problem 

const orders = await prisma.order.findMany() 

for (const order of orders) { 

  order.items = await prisma.orderItem.findMany({ 

    where: { orderId: order.id } 

  }) 

} 

 
 

// ✅ خوب: با include 

const orders = await prisma.order.findMany({ 

  include: { 

    items: { 

      include: { 

        product: true 

      } 

    }, 

    user: true 

  } 

}) 

\`\`\` 

 
 

### 5.6 Error Handling (⭐️⭐️ مهم) 

 
 

**Q: مدیریت خطا را چگونه پیاده کرده‌اید؟** 

 
 

A: "یک سیستم متمرکز error handling: 

1. **Custom Exceptions**: برای انواع خطاها 

2. **Global Exception Filter**: catch all errors 

3. **Structured Logging**: با Winston 

4. **Error Responses**: استاندارد و consistent" 

 
 

\`\`\`typescript 

// Custom Exception 

export class ProductNotFoundException extends NotFoundException { 

  constructor(id: string) { 

    super({ 

      statusCode: 404, 

      message: 'Product not found', 

      error: 'NOT_FOUND', 

      details: { productId: id } 

    }) 

  } 

} 

 
 

// Global Exception Filter 

@Catch() 

export class GlobalExceptionFilter implements ExceptionFilter { 

  catch(exception: any, host: ArgumentsHost) { 

    const ctx = host.switchToHttp() 

    const response = ctx.getResponse() 

     

    const status = exception.getStatus?.() || 500 

    const message = exception.message || 'Internal server error' 

     

    this.logger.error({ 

      status, 

      message, 

      stack: exception.stack, 

      timestamp: new Date().toISOString() 

    }) 

     

    response.status(status).json({ 

      statusCode: status, 

      message, 

      timestamp: new Date().toISOString() 

    }) 

  } 

} 

\`\`\` 

 
 

--- 

 
 

## 🔍 مرحله 6: تست‌های پیشرفته 

 
 

### 6.1 Load Testing (⭐️ مهم برای مصاحبه) 

 
 

\`\`\`bash 

# نصب Artillery 

npm install -g artillery 

 
 

# ایجاد فایل تست 

cat > load-test.yml << EOF 

config: 

  target: "http://localhost:3001" 

  phases: 

    - duration: 60 

      arrivalRate: 10 

      name: "Warm up" 

    - duration: 120 

      arrivalRate: 50 

      name: "Sustained load" 

scenarios: 

  - name: "Get Products" 

    flow: 

      - get: 

          url: "/api/v1/products" 

EOF 

 
 

# اجرای تست 

artillery run load-test.yml 

\`\`\` 

 
 

### 6.2 Memory Leak Detection 

 
 

\`\`\`bash 

# نصب clinic 

npm install -g clinic 

 
 

# پروفایل memory 

clinic doctor -- node dist/main.js 

 
 

# بررسی heap 

clinic heapprofiler -- node dist/main.js 

\`\`\` 

 
 

--- 

 
 

## 🐛 مرحله 7: رفع مشکلات رایج 

 
 

### مشکل 1: Database Connection Failed 

 
 

\`\`\`bash 

# بررسی PostgreSQL 

sudo systemctl status postgresql 

 
 

# بررسی اتصال 

psql -U kala_user -d kala_market -h localhost 

 
 

# بررسی connection string در .env 

DATABASE_URL="postgresql://kala_user:password@localhost:5432/kala_market" 

\`\`\` 

 
 

### مشکل 2: Redis Connection Error 

 
 

\`\`\`bash 

# بررسی Redis 

redis-cli ping 

 
 

# اگر خطا داد، راه‌اندازی مجدد 

redis-server 

 
 

# بررسی در backend 

npm run test:redis 

\`\`\` 

 
 

### مشکل 3: Port Already in Use 

 
 

\`\`\`bash 

# پیدا کردن process 

lsof -i :3001 

 
 

# کشتن process 

kill -9 <PID> 

 
 

# یا تغییر port در .env 

PORT=3002 

\`\`\` 

 
 

### مشکل 4: CORS Error 

 
 

\`\`\`bash 

# بررسی CORS_ORIGIN در backend/.env 

CORS_ORIGIN="http://localhost:3000" 

 
 

# بررسی NEXT_PUBLIC_API_URL در frontend/.env.local 

NEXT_PUBLIC_API_URL="http://localhost:3001/api/v1" 

\`\`\` 

 
 

### مشکل 5: Prisma Generation Error 

 
 

\`\`\`bash 

# پاک کردن node_modules و نصب مجدد 

rm -rf node_modules 

npm install 

 
 

# تولید مجدد Prisma Client 

npx prisma generate 

 
 

# اگر باز هم خطا داد 

npx prisma db push --force-reset 

\`\`\` 

 
 

--- 

 
 

## 📊 مرحله 8: Monitoring و Logging 

 
 

### 8.1 راه‌اندازی Logging 

 
 

\`\`\`typescript 

// backend/src/common/logger/logger.service.ts 

import * as winston from 'winston' 

 
 

export const logger = winston.createLogger({ 

  level: 'info', 

  format: winston.format.json(), 

  transports: [ 

    new winston.transports.File({ filename: 'error.log', level: 'error' }), 

    new winston.transports.File({ filename: 'combined.log' }) 

  ] 

}) 

\`\`\` 

 
 

### 8.2 بررسی Logs 

 
 

\`\`\`bash 

# مشاهده logs در real-time 

tail -f backend/error.log 

tail -f backend/combined.log 

 
 

# جست‌وجو در logs 

grep "ERROR" backend/combined.log 

grep "POST /api/v1/orders" backend/combined.log 

\`\`\` 

 
 

--- 

 
 

## ✅ Checklist نهایی قبل از مصاحبه 

 
 

### Backend: 

- [ ] Backend روی port 3001 اجرا شود 

- [ ] Swagger در `/api/docs` در دسترس باشد 

- [ ] همه endpoints کار کنند 

- [ ] Authentication با JWT کار کند 

- [ ] Database seeding موفق باشد 

- [ ] Redis cache کار کند 

- [ ] Rate limiting فعال باشد 

 
 

### Frontend: 

- [ ] Frontend روی port 3000 اجرا شود 

- [ ] صفحه اصلی نمایش داده شود 

- [ ] محصولات load شوند 

- [ ] لاگین/ثبت‌نام کار کند 

- [ ] سبد خرید کار کند 

- [ ] جست‌وجو کار کند 

 
 

### Documentation: 

- [ ] README.md کامل باشد 

- [ ] API Documentation آماده باشد 

- [ ] Architecture diagram داشته باشید 

- [ ] Database schema diagram داشته باشید 

 
 

--- 

 
 

## 🎯 سوالات رایج مصاحبه 

 
 

### 1. معماری پروژه 

**Q: چرا NestJS انتخاب کردید؟** 

- Modular architecture 

- Dependency Injection 

- TypeScript support 

- Scalability 

 
 

### 2. Database 

**Q: چرا PostgreSQL؟** 

- ACID compliance 

- Relations 

- JSON support 

- Performance 

 
 

### 3. Authentication 

**Q: چرا JWT؟** 

- Stateless 

- Scalable 

- Cross-domain 

 
 

### 4. Caching 

**Q: چرا Redis؟** 

- In-memory speed 

- TTL support 

- Pub/Sub 

 
 

### 5. Frontend 

**Q: چرا Next.js؟** 

- SSR/SSG 

- File-based routing 

- Image optimization 

- SEO friendly 

 
 

--- 

 
 

## 📈 Performance Benchmarks 

 
 

\`\`\`bash 

# معیارهای مورد انتظار: 

- API Response Time: < 100ms (cached) 

- API Response Time: < 500ms (database) 

- Database Query Time: < 50ms 

- Page Load Time: < 2s 

- Time to Interactive: < 3s 

\`\`\` 

 
 

--- 

 
 

**موفق باشید! 🚀** 

\`\`\` 

 
 

حالا فایل‌های اصلی Backend را کامل می‌نویسم: 

 
 

 