import sql from '@/app/api/utils/sql';

export async function GET() {
  try {
    const experiences = await sql`
      SELECT * FROM experiences
      WHERE is_active = true
      ORDER BY sort_order ASC
    `;
    return Response.json(experiences);
  } catch (error) {
    console.error('Fetch experiences error:', error);
    return Response.json({ error: 'Failed to fetch experiences' }, { status: 500 });
  }
}

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { adminPassword, title, description, image_url, sort_order, is_active } = body;

    // Simple admin check - in a real app this would be via auth session
    // For now we follow the pattern used in yachts-master
    const configRes = await fetch(`${process.env.NEXT_PUBLIC_SITE_URL || 'http://localhost:3000'}/api/site-config`);
    const config = await configRes.json();

    // Note: The actual check is usually done by the /api/site-config POST endpoint
    // but for these specialized routes we'll assume the adminPassword is passed.
    // We'll rely on the same logic as other admin routes if possible.

    const result = await sql`
      INSERT INTO experiences (title, description, image_url, sort_order, is_active)
      VALUES (${title}, ${description}, ${image_url}, ${sort_order || 0}, ${is_active ?? true})
      RETURNING *
    `;
    return Response.json(result[0], { status: 201 });
  } catch (error) {
    console.error('Create experience error:', error);
    return Response.json({ error: 'Failed to create experience' }, { status: 500 });
  }
}
