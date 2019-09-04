<script>
  import { onMount } from "svelte";

  let data = [];
  let query = "";

  $: filtered = data.filter(sub => {
    return sub.replacement.toLowerCase().indexOf(query.toLowerCase()) > -1;
  });

  onMount(load);

  async function load() {
    const res = await fetch(`/admin/subs/subs`);
    const json = await res.json();
    data = data.concat(json);
  }
</script>

<style>
  table {
    width: 100%;
  }
</style>

<input bind:value={query} type="text" placeholder="Search subs replacement" />
<table>
  <thead>
    <tr>
      <th>Id</th>
      <th>Replacement</th>
      <th>Regex</th>
    </tr>
  </thead>
  {#each filtered as sub}
    <tr>
      <td>
        <a href="/admin/sub/{sub.id}">{sub.id}</a>
      </td>
      <td>{sub.replacement}</td>
      <td>{sub.regex}</td>
    </tr>
  {/each}
</table>
