import AdminQueue from './AdminQueue.svelte'

const adminQueue = new AdminQueue({
	target: document.querySelector('#adminQueue')
})

export default { adminQueue }
