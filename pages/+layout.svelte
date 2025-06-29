<script>
	import '@evidence-dev/tailwind/fonts.css';
	import '../app.css';
	import { EvidenceDefaultLayout } from '@evidence-dev/core-components';
	export let data;
</script>

<EvidenceDefaultLayout {data}
neverShowQueries=true
builtWithEvidence=false
githubRepo=https://github.com/prteek/nest-smart
title='Nest Smart'
>
	<slot slot="content" />
</EvidenceDefaultLayout>
