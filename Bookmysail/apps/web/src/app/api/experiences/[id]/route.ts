import sql from '@/app/api/utils/sql';

export async function PUT(
  request: Request,
  { params }: { params: { id: string } }
) {
  try {
    const id = params.id;
    const body = await request.json();
    const { title, description, image_url, sort_order, is_active } = body;

    await sql`
      UPDATE experiences
      SET title = ${title},
          description = ${description},
          image_url = ${image_url},
          sort_order = ${sort_order},
          is_active = ${is_active}
      WHERE id = ${id}
    `;
    return Response.json({ success: true });
  } catch (error) {
    console.error('Update experience error:', error);
    return Response.json({ error: 'Failed to update experience' }, { status: 500 });
  }
}

export async function DELETE(
  request: Request,
  { params }: { params: { id: string } }
) {
  try {
    const id = params.id;
    await sql`DELETE FROM experiences WHERE id = ${id}`;
    return Response.json({ success: true });
  } catch (error) {
    console.error('Delete experience error:', error);
    return Response.json({ error: 'Failed to delete experience' }, { status: 500 });
  }
}
