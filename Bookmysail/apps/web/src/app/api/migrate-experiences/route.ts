import sql from '@/app/api/utils/sql';

export async function GET() {
  try {
    await sql`
      CREATE TABLE IF NOT EXISTS experiences (
        id SERIAL PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT,
        image_url TEXT,
        is_active BOOLEAN DEFAULT true,
        sort_order INTEGER DEFAULT 0,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
      );
    `;
    return Response.json({ success: true, message: 'Experiences table created successfully' });
  } catch (error) {
    console.error('Migration failed:', error);
    return Response.json({ error: 'Migration failed' }, { status: 500 });
  }
}
